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

#demo video link 
https://drive.google.com/file/d/1upXqRjPWivVd7r4STyVrRJeaK5ahMmDA/view?usp=sharing

#demo video of the task 
https://github.com/Shonu72/dhiwise_assignment/assets/67668844/b1224330-0561-4772-8bfa-91e3a8c616e8


#images of different screens

<p align="left">
  <img src="https://github.com/Shonu72/dhiwise_assignment/blob/main/lib/Images/homepage.png"  width="200" height="500" />
  &nbsp 
  <img src="https://github.com/Shonu72/dhiwise_assignment/blob/main/lib/Images/history.png"   width="200" height="500" />
    &nbsp 
  <img src="https://github.com/Shonu72/dhiwise_assignment/blob/main/lib/Images/profile.png"   width="200" height="500" />
    &nbsp 
  <img src="https://github.com/Shonu72/dhiwise_assignment/blob/main/lib/Images/search.png"   width="200" height="500" />



