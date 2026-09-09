# Security Design

Security is an absolute priority in this platform since users (workshop owners) have the ability to submit data and upload files (images).

## 1. SQL Injection Protection

Since we are using raw PHP, the database connection must use **PDO**.

* Never concatenate user inputs directly into an SQL query string.
* Always use **Prepared Statements** and parameter binding (`execute([$data])`).

## 2. Cross-Site Scripting (XSS) Protection

Users can write malicious JavaScript in the description or title of a post.

* **Input Validation:** Filter input to remove suspicious tags if possible, but more importantly...
* **Output Escaping:** Always escape any data when outputting it into HTML templates. Use PHP's `htmlspecialchars($data, ENT_QUOTES, 'UTF-8')` every single time you print user-generated text into a View.

## 3. Cross-Site Request Forgery (CSRF) Protection

Hackers could trick logged-in admins or owners into performing actions (like deleting a post).

* Generate a random CSRF token on the server and store it in the session.
* Include this token as a hidden field inside every form (`<input type="hidden" name="csrf_token" value="...">`).
* The controller processing POST/PUT/DELETE requests must verify that the submitted token matches the Session token before executing logic.

## 4. Secure File Uploads

Image uploads are a high-risk feature. Please see `IMAGE_UPLOAD.md` for full details, but the summary is:

* Never trust the extension (`.jpg`). Use `mime_content_type()` or `finfo_file()`.
* Limit file sizes (e.g., Max 5MB).
* Rename the file to a random string (preventing directory traversal attacks).
* The upload directory (`public/uploads`) must disable PHP execution via a strict `.htaccess` file so that even if a PHP file is uploaded, it won't be run by Apache.

## 5. Rate Limiting

To prevent brute-force login attacks and spam on the Report APIs, implement rate limiting:

* Prevent an IP address from trying more than 5 consecutive failed login attempts within 15 minutes.
* Prevent an IP address from submitting more than 3 reports per day.

## 6. Proper Error Handling (Information Disclosure)

* In the Production environment, **never** display raw PHP warnings, stack traces, or SQL errors to the user.
* Log all errors to `storage/logs/error.log` using a custom error handler.
* Display generic, friendly error messages to the user ("An unexpected error occurred. Please try again later").
