# Use Cases

## Use Case Diagram

```mermaid
usecaseDiagram
    actor Customer as "Customer (Guest)"
    actor Owner as "Workshop Owner"
    actor Admin as "Administrator"

    package "Blacksmith Marketplace Portal" {
        usecase UC1 as "Browse Works"
        usecase UC2 as "Search & Filter"
        usecase UC3 as "View Work Details"
        usecase UC4 as "View Workshop Profile"
        usecase UC5 as "Contact Owner"
        usecase UC6 as "Report a Post"
    }

    package "Workshop Dashboard" {
        usecase UC7 as "Register / Login"
        usecase UC8 as "Manage Profile"
        usecase UC9 as "Add New Work"
        usecase UC10 as "Edit/Delete Work"
        usecase UC11 as "Upload Images"
    }

    package "Admin Dashboard" {
        usecase UC12 as "Manage Users (Owners)"
        usecase UC13 as "Manage Categories"
        usecase UC14 as "Review Reports"
        usecase UC15 as "Delete Violating Posts"
    }

    Customer --> UC1
    Customer --> UC2
    Customer --> UC3
    Customer --> UC4
    Customer --> UC5
    Customer --> UC6

    Owner --> UC7
    Owner --> UC8
    Owner --> UC9
    Owner --> UC10
    Owner --> UC11
    
    UC9 ..> UC11 : <<includes>>

    Admin --> UC12
    Admin --> UC13
    Admin --> UC14
    Admin --> UC15
```

## Details of Main Use Cases

### UC9: Add New Work

* **Primary Actor:** Workshop Owner.
* **Description:** The workshop owner publishes a new model or work to be displayed on the platform.
* **Steps:**
  1. The workshop owner logs into their dashboard.
  2. Clicks on the "Add New Work" button.
  3. Selects the appropriate Category.
  4. Enters the work title, description, location, and dimensions (if any).
  5. Uploads the required images.
  6. Chooses whether the price is known or on demand.
  7. Clicks the Save and Publish button.
* **Result:** The work immediately appears on the workshop's profile page and also within the platform's public categories, displaying the attached images.

### UC5: Contact Owner

* **Primary Actor:** Guest / Customer.
* **Description:** A customer wishes to inquire and assign the blacksmith to execute a work they saw.
* **Steps:**
  1. The customer opens the work details page.
  2. Clicks on the "Contact via WhatsApp" button or reveals the phone number for inquiry.
  3. The customer is directed to the WhatsApp application and starts the conversation directly. (In Version 1, there is no internal chat).
* **Result:** The workshop owner receives an inquiry from a customer directed by the platform.

### UC14: Review Reports

* **Primary Actor:** Administrator (Admin).
* **Steps:**
  1. A customer submits a report about a post (e.g., inappropriate image).
  2. The Admin logs into the dashboard.
  3. Navigates to the "Reports" section.
  4. The Admin evaluates the report and views the concerned post.
  5. If the violation is confirmed, the Admin deletes the post (linked with UC15).
* **Result:** Protecting the overall content quality in the marketplace.
