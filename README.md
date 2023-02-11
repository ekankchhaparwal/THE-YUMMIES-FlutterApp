

# The Yummies - FLutter APP

Welcome to The Yummies App!

This app allows you to browse a variety 
of delicious meals and save your favorites 
for easy access later.

The providers Package is used to store and manage all the Data Objects.  It provides a state management technique that is used for managing a piece of data around the app.

On clicking the image of any meal you are navigated to a new screen which displays the recipe of the Meal with its title, image, Recipie Properties like vegetarian/ Non vegetarian , preparation Time, preparation cost.

If you come across a recipe that you particularly enjoy, you can add it 
to your favorites section by clicking  the "Heart" button on footer part of the 
image of the particular meal.The Favorite Dishes can then be accessed 
by selecting the "Favorites" option from the PopUpMenuOption.

On clicking the Drawer icon ,you can select the editMealsScreen to know all your meals in a screen using ListTile.
# Filters 
On clicking the popUp menu the user will be shown four Option to choose : AllMeals , Favourites , Veg Meal , Non-Veg meal to filter the meal Recipies.

# Adding a new Meal Recipie :
On clicking the plus button a new screen is opened which has a form to fill the details about the meal like recipie , cost , time , vegetarian or not etc..
For now, I am using Image.network to show the image.
You can add a new Meal by choosing the option for New Meal in the Drawer Widget.

# Deleting a meal Recipie :
The delete icon,on clicking deletes the Meal Completely from the local Storage 

# Editing the meal details :
The edit icon,on clicking lets you edit details of the Meal Completely and update  the same in the local Storage. 

# About Hive Integration :
The Hive Integration with the App is done and all the dishes recipies can be saved locally. The dishes can be read, updated, delete from local storage through hive using the concept of type-adaptor helps to Store Data Objects. 

# ScreenShots of the App

All the ScreenShots can be found in the 'ScreenShots-APP' folder to access all the ScreenShots of the App.

#User Authorization 

FireBase is used for User Authorization. The user is needed to enter the emailId and Password to enter the main screeen of the App. The users can create a new account if they dont have an account. 
 Features like Automatic LogIn and LogOut has been implemented using sharedPreferences to store token-Id.     


## About the API's used 
1) Link :  https://pub.dev/packages/simple_gradient_text

Uses : Create fast  gradient texts, whether linear or radial, you can  decide the colors (No restriction in Number) and the text to display.
