# Testing Strategy

Although this is the MVP phase, maintaining standard testing practices ensures fewer bugs reaching production, especially for critical flows like authentication and file uploads.

## 1. Unit Testing

Using **PHPUnit** to test standalone functions and core logic.

* **Services:** Test the Validation service (does it properly reject invalid emails? Does it require passwords to have a certain length?).
* **Image Uploader:** Mock the file system, test if the uploader correctly renames files, throws exceptions for invalid MIME types, and respects size limits.

## 2. Integration Testing

Testing components communicating with each other and the Database setup.

* **Database Models:** Test the CRUD (Create, Read, Update, Delete) methods belonging to the Post and User models.
  * Ensure inserting a Post correctly assigns the foreign key.
  * Ensure deleting a user cascades (or soft-deletes) their posts (based on DB rule decisions).

## 3. End-to-End & UI Testing

Since we are using vanilla JS and standard HTML rendering, complex E2E frameworks might be overkill right now, but manual QA flows are mandatory.

* **Critical Path 1:** Register -> Login -> Add Post with 2 Images -> Ensure Post Appears on Homepage.
* **Critical Path 2:** Guest -> Search for Post -> Open Post -> Click WhatsApp link.
* **Responsive QA:** Test every major page via Chrome DevTools Mobile View (iPhone SE, iPhone 14 Pro, Samsung Galaxy formats) to ensure no horizontal scrolling issues exist and buttons are finger-tap friendly.

## 4. Security Testing

Run basic penetration testing checks:

* Attempt SQL injection strings (e.g., `' OR 1=1 --`) in login and search forms.
* Attempt XSS scripts in post titles (e.g., `<script>alert('hack')</script>`).
* Attempt uploading a `.php` file disguised as an image into the upload section and try to execute it by navigating to its URL.
