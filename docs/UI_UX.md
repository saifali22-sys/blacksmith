# UI/UX Structure

The platform targets both end-consumers (looking for inspiration and contractors) and business owners (who may not be highly tech-savvy).
The design principles focus on clarity, big visuals, simplicity, and being **Mobile-First**.

## Design Guidelines

* **Responsive Design:** 100% fluid layouts with Flexbox and Grid. Most customers will browse properties and designs from their mobile phones.
* **RTL First:** Since the target demographic is Arabic speakers, the entire layout structure (menus, margins, text alignment) must be Right-To-Left native.
* **Color Palette Suggestions:** Professional industrial tones. Dark Grays (Iron/Steel vibes), contrasting with vibrant call-to-action buttons (like WhatsApp Green or a distinct brand Blue).
* **Typography:** Clean, legible Arabic fonts (e.g. Cairo, Tajawal, or Almarai from Google Fonts).

## Main Views (Pages)

### 1. Public Portal (Customer Facing)

* **Home Page:**
  * Hero Section (Catchy phrase + Search bar).
  * Quick Categories (Visual cards with icons - Doors, Stairs...).
  * Featured / Latest Works (Gallery grid).
* **Category Listing Page:**
  * Sidebar filters (City, Sub-categories).
  * Content grid with Post Cards (Image thumbnail, Workshop Name, Title).
  * Pagination controls.
* **Post Details View:**
  * Large Image gallery slider.
  * Sidebar with the Workshop details, City, Specifications.
  * Huge "Contact via WhatsApp" / "Call Now" buttons.
  * "Report this post" small link at the bottom.
* **Workshop Public Profile:**
  * Workshop Banner/Logo.
  * Description and Contact info.
  * Grid of all their active posts.

### 2. Workshop Owner Dashboard

* **Overview/Home:** Quick stats (Total posts).
* **Manage Works:** A data table listing all their posts, with buttons to Edit or Delete.
* **Add Work Form:** A clean form relying on distinct sections (Info -> Specs -> Images upload area).
* **Profile Settings:** Form to update Name, Password, and contact info.

### 3. Admin Dashboard

* Requires a standard dashboard template (Sidebar navigation, top navbar, main content white-cards).
* **User Management:** Table listing all workshops with "Ban/Activate" toggles.
* **Category Management:** Add/Edit/Delete lists.
* **Reports:** A unified inbox for reviewing customer reports about posts.
