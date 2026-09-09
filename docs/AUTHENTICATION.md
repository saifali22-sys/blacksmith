# Authentication & Authorization

For a PHP MVC web application, managing user authentication and authorization securely is a top priority.

## Authentication Mechanism

### 1. Sessions vs JWT

Since Phase 1 primarily consists of a web-based dashboard and public portal built with PHP (Server-Side Rendering), we will use **PHP Sessions**.

* When a user logs in successfully, their User ID and Role are stored in the `$_SESSION` global variable.
* The session is validated on every restricted request.
* If a pure REST API for a mobile app is built in later phases, we will migrate to **JWT (JSON Web Tokens)** for stateless authentication.

### 2. Password Security (Hashing)

* **Never store plain-text passwords.**
* We must use PHP's native `password_hash()` function, which implements the Bcrypt algorithm by default (or Argon2 if supported).
* When authenticating a user during login, we use `password_verify()` to compare the user's input with the hashed password in the database.

## Authorization (Access Control)

### Role-Based Access Control (RBAC)

We have exactly two roles that can log in: `owner` and `admin`.

**1. Workshop Owner (`owner`):**

* Access is granted to route group `/dashboard/*`.
* **Important check:** The owner must ONLY be able to edit, delete, or update posts and images that belong to their specific `workshop_id`.
* The server must never trust hidden form fields like `<input type="hidden" name="user_id">`. The ID of the currently logged-in owner must be fetched exclusively from the secure Session variables.

**2. Administrator (`admin`):**

* Access is granted to route group `/admin/*`.
* Admins can view everything, delete any violating post, ban users, and add new categories.

## Implementation Details (Middleware)

To enforce this, we implement a Middleware pattern or a Base Controller check:

* `AuthMiddleware`: Checks if `isset($_SESSION['user_id'])`. If not, it redirects the user to `/login`.
* `AdminMiddleware`: Checks if `$_SESSION['user_role'] === 'admin'`. If not, throws a 403 Forbidden error.
* `OwnerMiddleware`: Checks if `$_SESSION['user_role'] === 'owner'`.

### Password Reset Flow

(Deferred to later stages, but standard approach applies):

1. User requests a reset by entering their email.
2. System generates a secure random token (e.g., `bin2hex(random_bytes(32))`), hashes it, stores the hash in a `password_resets` table with an expiration timestamp (e.g. 1 hour).
3. System emails the plain-text token link to the user.
4. User clicks link, enters a new password. The token is verified and the password is overwritten.
