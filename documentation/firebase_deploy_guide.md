# Firebase Hosting Deployment Guide

This guide outlines the steps to deploy a Firebase Hosting site, ensuring that the correct deploy target is set up.

## 1️⃣ Verify Existing Hosting Sites
Before deploying, check if your Firebase project has the correct hosting sites configured.

Run the following command:
```sh
firebase hosting:sites:list --project <your-project-id>
```
This will list all hosting sites associated with your Firebase project.

- If you see your expected site name, note the **Site ID**.
- If the expected site is missing, it may have been deleted or renamed.

---

## 2️⃣ Set Your Firebase Project
If Firebase CLI doesn’t recognize your project, set it up manually:

Run:
```sh
firebase use --add
```
Follow the prompts to select `<your-project-id>` and set an alias (e.g., `default`).

Alternatively, you can directly set the project using:
```sh
firebase use <your-project-id>
```

To confirm the active project, run:
```sh
firebase projects:list
```

---

## 3️⃣ Reapply the Hosting Target
If your deploy target is missing or not configured, set it up again:

1. First, get your **Site ID** from Step 1.
2. Apply the target with:
   ```sh
   firebase target:apply hosting <target-name> <site-id>
   ```
   Example:
   ```sh
   firebase target:apply hosting business my-site-id
   ```
3. This will update the `.firebaserc` file with the correct mapping.

To confirm the applied targets, check:
```sh
cat .firebaserc
```

---

## 4️⃣ Deploy to Firebase Hosting
Now, deploy your site using:
```sh
firebase deploy --only hosting:<target-name> --project <your-project-id>
```
Example:
```sh
firebase deploy --only hosting:business --project my-firebase-project
```

If the deployment is successful, Firebase will provide a hosting URL where your site is live.

---

## Troubleshooting
- **"Error: Deploy target not configured"** → Reapply the hosting target (Step 3).
- **"Must have an active project"** → Set your Firebase project (Step 2).
- **Conflicts in `firebase.json` or `.firebaserc`?** → Ensure correct mappings exist.

For more details, visit [Firebase Hosting Docs](https://firebase.google.com/docs/hosting/).

---

