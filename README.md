# Campus Life Assistance App

## 1. Login Screen
**Purpose:** Allow users to log in or sign up using email and password.

**Widgets**:
- **Email Field**: Text input for the user’s email.
- **Password Field**: Text input for the user’s password.
- **Login Button**: Button to authenticate using Firebase Authentication.
- **Sign-Up Link**: Text link to navigate to the Sign-Up screen.
- **Forgot Password Link**: Text link for password recovery.

![Login Screen](https://github.com/user-attachments/assets/1d8850da-54dc-4b77-b686-f0a61d1d0824)

---

## 2. Sign-Up Screen
**Purpose:** Allow new users to register.

**Widgets**:
- **Name Field**: Text input for the user’s name.
- **Email Field**: Text input for the user’s email.
- **Password Field**: Text input for the user’s password.
- **Sign-Up Button**: Button to create an account.
- **Back to Login**: Text link to navigate to the Login screen.

![Sign-Up Screen](https://github.com/user-attachments/assets/dfc8203f-715e-4189-8fca-45d4ddb71ab7)

---

## 3. Home Screen
**Purpose:** Dashboard with navigation to all features.

**Widgets**:
- **App Bar**: Title or greeting (e.g., "Welcome, [User Name]!").
- **Navigation Grid**: Buttons or cards linking to:
  - Class Schedule
  - Assignments
  - Notifications
  - Study Groups
  - Feedback
- **Profile Icon**: Button to access the user’s profile settings.

![Home Screen](https://github.com/user-attachments/assets/4b8fbdc8-b602-4026-bc90-ce4a75d076d3)

---

## 4. Class Schedule Screen

**Purpose:** Manage and view class schedules.

**Widgets**:
- **List View**: Displays a list of classes with details such as:
  - Subject
  - Time
  - Room
- **Add Button**: A floating action button (FAB) to add a new class.
- **Edit/Delete Options**: Swipe actions or buttons to edit or delete entries.
![scheduleclasses](https://github.com/user-attachments/assets/d203f6a2-730e-4a3f-b9e8-6ae68cb941b3)

---

## 5. Add Class Screen

**Purpose:** Add a new class to the schedule.

**Widgets**:
- **Fields**:
  - **Subject Field**: Text input for the class subject (e.g., "Mathematics").
  - **Time Field**: Time picker for setting the class time.
  - **Room Field**: Text input for the room number or location.
  - **Day Field**: Dropdown or picker to select the day of the week.
- **Save Button**: Saves the class details to Firestore and SQFlite.

**Actions**:
1. On pressing the Save button:
   - Validate all fields for required inputs.
   - Save the data to Firestore for cross-device sync.
   - Save the data to SQFlite for offline access.
![addclass](https://github.com/user-attachments/assets/c64d8288-b627-49af-acec-9b4aa8b1dc6f)

---

## 6. Edit Class Screen

**Purpose:** Edit the details of an existing class.

**Widgets**:
- **Fields**:
  - **Subject Field**: Pre-filled text input with the current subject.
  - **Time Field**: Pre-filled time picker with the current time.
  - **Room Field**: Pre-filled text input with the current room details.
  - **Day Field**: Pre-filled dropdown or picker with the current day.
- **Save Button**: Updates the class details in Firestore and SQFlite.

**Actions**:
1. On pressing the Save button:
   - Validate all updated fields.
   - Update the class details in Firestore for real-time updates.
   - Update the class details in SQFlite for offline access.
![editclass](https://github.com/user-attachments/assets/cd565d97-0bdb-4827-990c-b36803277fee)

---
