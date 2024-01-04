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


#demo video of task
https://github.com/Shonu72/dhiwise_assignment/assets/67668844/95c854e5-35d6-4f2f-9f4b-2f785962db10

#images of different screens
![homepage](https://github.com/Shonu72/dhiwise_assignment/assets/67668844/f6613a59-970b-412f-8dad-9b353fbd04a4)

![history](https://github.com/Shonu72/dhiwise_assignment/assets/67668844/50650b59-35ad-4aeb-aa5d-e3ad3ad292dd)

![search](https://github.com/Shonu72/dhiwise_assignment/assets/67668844/0ad604f9-3f25-4a82-bdc5-08c2d4de3432)

![profile](https://github.com/Shonu72/dhiwise_assignment/assets/67668844/417420e6-2a77-491e-bb5c-cedd269e3f25)

