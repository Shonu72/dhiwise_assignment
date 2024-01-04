# finance
# To run this app, 
- Just clone this project and open it into vscode or android studion and run pub get and run app.

# if you want to create own firebase setup then need to follow these steps : 
- Create new project and configure with firebase cli
- it will generate all the file including firebaseoptions and google-services.json automatically
 - create instance of firebase into your app and get data from firestore 

## Firestore security rules that restrict access to authorized users
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Allow read and write access to only authenticated users
    match /goals/{document=**} {
      allow read, write: if request.auth != null;
    }
  }
}





