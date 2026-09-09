# Development Roadmap

The development of the platform will be structured logically, focusing on foundation first, backend logic second, and frontend assembly third. **Do not begin coding until the documentation is approved.**

## Step 1: Foundation & Setup

1. Validate and finalize this exact documentation with the project owner.
2. Setup the local environment (WAMP64), create the Database, and run the SQL tables creation script (based on `DATABASE_DESIGN.md`).
3. Setup the Folder Structure (`app/`, `public/`, etc.).
4. Build the core routing system (`index.php`, `Router` class) to intercept URLs.

## Step 2: Backend MVC Skeleton

1. Base Controller and Base Model classes.
2. Helper classes (Session management, CSRF Token generation).
3. Basic View rendering logic (loading Header/Footer).

## Step 3: Authentication Module

1. Build Registration Backend and Frontend form.
2. Build Login/Logout mechanism.
3. Apply Authentication Middleware (prevent guest access to owner dashboard).

## Step 4: Admin Dashboard (Core Setup)

1. Build simple admin login.
2. Build Category CRUD (Create, Read, Update, Delete) so the system has categories to link posts to.

## Step 5: Workshop Owner Flow (The Core)

1. Build the Owner Dashboard layout.
2. Build "Manage Profile" (Update details).
3. Build the "Add Post" backend (the most complex piece).
4. Implement secure Image Upload logic, associating images with the created post.
5. Create "Edit Post" and "Delete Post" logic.

## Step 6: Public Portal (Customer View)

1. The Home Page (fetch recent works from DB).
2. Category listings (Filter posts).
3. Individual Post Details (Gallery view, contact buttons).
4. Public Workshop Profile.

## Step 7: Final Touches & Launch Preparation

1. Implement the Search functionality.
2. Implement the "Report" post functionality for customers.
3. Review UI on mobile devices (Responsive checks).
4. Final Security checks (SQL Injection, XSS, upload tests).
5. Deploy to Production server.
