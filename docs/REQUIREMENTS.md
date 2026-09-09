# Requirements

## Functional Requirements

### 1. Account Management

* A workshop owner must be able to create an account and confirm it.
* A workshop owner must be able to log in and log out.
* A workshop owner must be able to recover their password (Reset Password).

### 2. Workshop Management (Workshop Profile)

* Every workshop owner must have a special profile page.
* A workshop owner can edit: workshop name, description, city, phone number, and workshop logo/profile picture.
* A workshop owner can select the Categories they work in.

### 3. Works & Posts Management

* A workshop owner must be able to create a post for a new work / model.
* A post must include: title, description, category, dimensions (optional), materials (optional), price (optional), and execution city.
* A workshop owner can choose "Price on Demand" to hide the price.
* A workshop owner must be allowed to upload multiple images per post.
* A workshop owner can edit or delete their posts.

### 4. Browsing and Searching (Customers)

* A customer does not need an account to browse the platform.
* The homepage must display the latest works, featured works, and categories.
* The platform must provide a filtering system based on: category, city, and design.
* A text search system must be available to search by title, description, or workshop name.

### 5. Work Details

* A work details page must be displayed containing an image gallery.
* Workshop contact information must be displayed clearly.
* A link to navigate to the workshop profile and its other posts must be provided.

### 6. Administration System (Admin Panel)

* The admin must have a dashboard to manage the system as a whole.
* The admin can add, edit, and delete main categories (doors, windows...).
* The admin can manage workshop owner accounts and ban any violating account.
* The admin can delete violating works.
* The admin can read customer reports about violating posts.

---

## Non-Functional Requirements

### 1. Security

* Hash all passwords using a secure hashing algorithm (Bcrypt / Argon2).
* Protect all forms against Cross-Site Request Forgery (CSRF).
* Protect the platform against SQL Injection using Prepared Statements (PDO).
* Filter and sanitize inputs to prevent XSS vulnerabilities.
* Implement a strict image upload system to prevent uploading malicious files (PHP, EXE, etc.).

### 2. Performance & Scalability

* Page load time should not exceed 3 seconds.
* Images must be compressed and optimized during upload.
* The database and system architecture must be scalable to add Review and E-commerce features in the future.

### 3. UI/UX - Responsive Design

* The design must be 100% responsive and mobile-first, as the majority of customers use smartphones.
* Support Right-to-Left (RTL - Arabic language) as a core feature.

### 4. Search Engine Optimization (SEO)

* Provide SEO-Friendly URLs.
* Structure pages using HTML5 Semantic Tags.
* Provide dynamic Meta Data for work and workshop pages.
