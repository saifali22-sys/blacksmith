# API Documentation

Since the project is built to be scalable (including potentially building a Mobile App in the future), developing an internal API (RESTful API) is required.
The Frontend could rely purely on Template Rendering or use AJAX (Fetch) consuming these endpoints. Regardless, mapping out an API structure is an excellent practice.

## Standard Response Format

All responses should return a standardized JSON format:

```json
{
  "status": "success",  // or "error"
  "data": { ... },      // Returned payload
  "message": "Invalid password provided" // In case of error or success flash messages
}
```

---

## 1. Authentication

### `POST /api/auth/register`

Creates a new workshop owner account.

* **Request Body:** `{ email, password, password_confirmation, workshop_name, phone_number }`
* **Response:** Success and login capabilities.

### `POST /api/auth/login`

Account login.

* **Request Body:** `{ email, password }`
* **Response:** Grants access (Session ID based on project architecture, or JWT if completely decoupled).

### `POST /api/auth/logout`

Logs out and invalidates the session.

---

## 2. Public Endpoints (Posts & Categories)

### `GET /api/categories`

Fetches a list of all active application categories.

### `GET /api/posts`

Fetches the latest public posts.

* **Query Parameters:** `?category=1&city=Amman&page=2` (For filtering and Pagination).

### `GET /api/posts/{id}`

View full post details including its images.

* **Response:** Full work details, sub-images array, and contact info of the workshop.

---

## 3. Workshop Info Endpoints (Public)

### `GET /api/workshops/{id}`

Fetches the profile info of a specific workshop.

### `GET /api/workshops/{id}/posts`

Fetches the list of posts made by a specific workshop (Used in the Workshop Profile).

---

## 4. Owner Dashboard Endpoints

*These endpoints require an Authentication mechanism (Session or Token) with the 'owner' role.*

### `POST /api/dashboard/posts`

Creates a new post.

* **Body Form-Data:** Contains textual inputs and a file array `images[]`.

### `PUT /api/dashboard/posts/{id}`

Updates post data. (Note: Updating images might be handled by a separate endpoint).

### `DELETE /api/dashboard/posts/{id}`

Deletes a work post.

### `DELETE /api/dashboard/images/{id}`

Deletes a specific image belonging to an owner's post.

---

## 5. Report System (Public)

### `POST /api/reports`

Submits a report on a specific post (Can be done by any visitor).

* **Request Body:** `{ post_id, reason, additional_details }`
* **Rate Limiting:** Important here to prevent spam (e.g. 3 reports per IP per day).
