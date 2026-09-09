# Image Upload System

Images are the core value of this platform to display blacksmithing models. Therefore, the upload functionality must be smooth, optimized, and heavily secured.

## Required Features

* Multiple uploads per post.
* Dedicated profile/logo image for workshops.
* A "Main Image" assigned per post to serve as a thumbnail.

## The Upload Flow & Security Requirements

### 1. File Type Validation

* **Do not rely on the file extension** provided by the user. A file might be named `image.png` but actually contain a malicious PHP script.
* Use PHP's `finfo_file` (Fileinfo extension) to check the real MIME type of the uploaded file.
* Allow only: `image/jpeg`, `image/png`, and `image/webp`.

### 2. File Size Limitations

* Limit image sizes to a maximum of **5 MB** per image at the PHP level (`upload_max_filesize`).
* Validate file size in the backend script before attempting to process it.

### 3. File Renaming

* Never save the file with its original name. If a user uploads `my_work.jpg`, rename it completely.
* Use `uniqid()` combined with hashing or `random_bytes()` to ensure file names are unique and unpredictable.
* Example: `post_64a7c88b9ea12_8a2b.jpg`.

### 4. Storage Location & Execution Protection

* Images will be stored in `public/uploads/posts/` and `public/uploads/profiles/`.
* You **must** create an `.htaccess` file inside the `uploads/` folder containing the following to disable PHP execution entirely in that directory:

  ```apache
  <FilesMatch "\.(php|php5|php7|php8|phtml)$">
      Order Deny,Allow
      Deny from all
  </FilesMatch>
  php_flag engine off
  ```

### 5. Image Optimization (Future-proof but needed now)

* Unoptimized images will vastly slow down the load times on mobile devices.
* Use the PHP `GD` or `Imagick` extension to resize uploaded images (e.g., maximum width 1920px) and compress their quality to 80% before saving them to disk.
* Generating a small thumbnail version (e.g. 400x400) for the category galleries will greatly improve listing performance.

### 6. Deletion Process

* When a post is deleted from the database, the physical image files on the server associated with that post must also be deleted using PHP's `unlink()` to avoid server storage bloat.
