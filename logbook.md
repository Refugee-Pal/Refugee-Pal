# 🗓️ 2023-03-07: Week 1

### Researching No Code and Backend

**********Ali:********** Researched potential no code options to pursue from Bubble, DraftBit, and Flutter-flow. Wrote some specific things we are looking for in a no code builder including translation, exporting source code, backend, and easy feature flexibility and implementation. Analyzed the advantages and disadvantages of each and wrote everything on a document. 

**Antony:** Researched backend implementation and wrote a document titled “Data for Backend”. - -This document outlines the data that will be included in three databases for the Refugee Pal app: Users, Locations and Programs/Events. Each database will contain specific information relevant to its purpose, such as user information, location details, program/event specifics, and step-by-step guides for refugees.

### Discussing plans

Ali and Antony: We hopped on call together and began brainstorming and outlining plans for what exactly we want to do.. We settled on using a no code builder, since we wanted a mobile app which could work on both IOS and Android, and because we had a limited amount of time. We discussed no code options, and also did some brainstorming on a Figjam file of the user journey and other features. 

### Setting Up FlutterFlow

Ali: We decided that we would be using FlutterFlow, so I began testing the software and understanding it to get over the learning curve as early as possible. I also setup things like Github integration and connecting the Firebase database to the project.

### Working on Wireframe Sketches

Antony: Ali had started some wireframe sketches planning out the user journey, so during this week I decided to continue working on wireframe sketches on Figma. This mockup will help us a lot because we will have a clear picture and idea of what the user interface should look like.

# 🗓️  2023-03-17: Week 2

### Overcomign the Learning Curve with FlutterFlow and Understanding Query Collections

Ali: So far, i have gotten a good grasp and understanding of the no code software and how it works. However, i still didnt understand some key concepts like query collections, document references, and more. So i followed a 30 minute tutorial by flutterflow on displaying data from the firestore database. This would be essential to understand for the rest of our features

### Continuing Working on Wireframe Sketches

Antony: Currently trying to finalize wireframe sketches of the app. I outlined features like the chat, map, settings, user journey, and more. For the wireframes, I laid out how the different features would integrate with each other and the database, for example adding contacts to each location. 

### Starting to Work on Digital Resource Hub and Structuring Firestore NoSQL Database

Ali: The first feature i want to complete is the digital resource hub, so i began planning a roadmap for implementation. At first, i thought of having individual pages for every category and subcategory, but then realized it would be very tedious, ineffective, and slow. The better way was to use the firestore database. At this point, i encountered many roadblocks when trying to structure the database. The digital resource hub was very complex because there is first a category gallery page, then a detailed category page with subcategories, and then another subcategory detailed page. One thing inside of the other.

### Challenges when Working on Firestore database for Categories, Subcategories, and Resourceproviders

Ali: This is when i got the bulk done of the digital resource hub. I realized some mistakes I was making. First was not building the database from bottom to top. I created individual collections for categories, subcategories, and then resource providers which was essentially the content of a subcategory. Each one had certain schemas with data which I also figured out how to display.

### Making Pages for Digital Resource Hub and Backend Querying

Ali: I spent this time creating all the pages of the digital resource hub and making backend query in each one from a specific collection. I had a page wich was a gallery of cards of all the different categories, then a page of an individual category which has a list of its subcategories, and then a subcategory page with information and resource providers, each making a backend query to its respective collection.

# 🗓️ 2023-03-24: Week 3

### Encountering Issues with Digital Resource Hub, Passing Data from Page to Page

Ali: When working on the digital resource hub this day, I encountered two issues which I managed to solve successfully. Firstly was how would i pass data from one page to the other. For example, if you clicked on a category card in the gallery and it lead to you to the same page every time, how would it take the data from the previous page and pass it on? 

After reading the FlutterFlow documents and watching a couple tutorials, i realized how to do this. I had to create a parameter which would pass and define data with an action.

### Figuring out how to Filter Displayed Information from Database in Digital Resource Hub Pages

The other issue was how I would filter the subcategories and resourceproviders being displayed in the page. All the subcategories of every category are in one document, and when making a backend query i only wanted to display data which was specific to its category. I got some help from Antony to set up a dedicated sub-page which would pass the category and subcategory into the page which displayed subcategories and resource providers. By the end of today, however, I had finally completed the digital resource hub.

### Antony Finished App Mockup Wireframe

Antony: By this week, I had completed the wireframe sketches and I could move on. to Flutterflow, so we could get more work done as a team. In the beginning, the learning curve was steep especially with widget organization and passing data, which I was not used to. After a few days however, I had learned the basics and started working on the app.

### Collaborating on FlutterFlow

Ali and Antony: This week, we decided to split our work on Refugee Pal, because we knew from previous experience that we could get more work done if we worked on one feature each. So, Ali decided to work on the Healthcare Professionals Directory, while Antony worked on the Interactive map, which would display locations, services and programs important for refugees.

Antony: Unfortunately, we realized that we could not work on Flutterflow at the same time, because it would kick us, so we decided to work on the app at separate times, and work on the projectboard while the other person was on Flutterflow.

### Working on Connect with Healthcare Professionals

Ali: I began working on the Connect with healthcare professionals directory. The first thing i did which was create a document for every profession_language. Then i also filled all these collections with data from the web app. I also created a simple card to display this data and figured out how to query a list of documents from a collection which worked!

Ali: I continued working on the healthcare professionals directory, and encountered an issue. I wasnt sure how to filter the healthcare professionals by language and profession. Dropdowns were causing major bugs with flutterflow. I got stuck on this and asked Antony to start working on this because he had created the interactive map feature which had a filter function, I thought maybe he would have a better idea on how to do this.

### Working on Interactive Map

Antony: I started working on the interactive map for refugees. I first started off integrating the Google Map into the page. In the beginning, I was confused about how I could add markers and trigger an action on tap, so I consulted the Flutterflow docs. Then I connected the google map widget to a collection called locations, where we stored all our location data.

Antony: Around this time, I also transferred much of our old data for our school science fair to Firebase, which took a lot of manual copy-pasting, If I were to do it again, I would have tried to convert the Excel file to CSV and then firebase using third-party integrations. I also improved some of the data, adding descriptions and emails for each location.

Antony: The last part of the interactive map was a bottom sheet that would pop up whenever a marker was clicked on. Thanks to the wireframe sketches I mad earlier, I already had my design and this process was extremely smooth, I also added a simialr filter page for locations, where users could filter by different categories.

# 🗓️ 2023-03-31: Week 4

### Working on the Digital Resource Hub

Ali: This week, I had to fill in the digital resource hub. It was fully functional but the main problem was that there was no data. This took around 6 hours to do, researching information on programs for different things like employment and english, but i also reused some of the data from our first prototype, the web application’s digital resource hub. However, the content still needed a lot of improvement.

### Projectboard, Posterboard, and Video

Ali: I decided to take a break from no code for a while to work on our Projectboard and our physical posterboard. I wrote all the content in the projectboard and then also created our 1 minute video using Canva. It took a lot of time screenshotting everything in the app too. I also printed all the stuff to put on the posterboard.

### Working on Connect and Chats

Antony: This week, I worked on the connect chat feature, which would allow refugees to chat with settlement workers, case managers and other helpers, as well as post and view questions. This proved to be challenging, which I will explain later.

Antony: Much of the chat feature involved state variables, which are variables which control the state of a page, such as if the user is chatting, the page would show a chat interface and hide all other interfaces. While working on the chat feature, I had to have a list of contacts, a chat interface and inetrfaces for initiating new chats. This was very difficult, and on mukltiple occasions there was a null value error, which meant some values were empty. At the beginning, I did not know what caused the error, but after a day I found out it was a databaseissue, which I completely overlooked.

# 🗓️ 2023-04-06: Week 5

### Making the Explore Page

Antony: For this weeks, I implemented the homepage, which would link to locatiosn, resources and Q&a chat threads. This was easier than expected, which allowed me to move on to the user journey. In the user journey, the user can indicate if they are a refugee or helper, which would adapt the app to their needs. The app would also ask for some information which could lead to improved filters, such as for healthcare professionals.

### Refugee Pal for Helpers

Antony: This brings me to Refugee Pal for Helpers. This was one of our main priorities for the nocode app, because we knew that we could not write all the information for the app ourselves; it had to act as a bridge between organizations, refugee sponsors and helpers and refugees. So, we implemented a separate version of the app where helpers could edit the digital resoruce hub, locations on the intercatiove map and chat with refugees. Unfortunately, since this was done last minute we could not implemented a better user journey for helpers, including organizations and adding people to a location as contacts.

### Figuring out how to Run Flutter and Refugee Pal on iOS

Ali: We were able to run the app on test mode using Flutterflow. However, we had to figure out how we would demo the app on a mobile device. This took a realyl long time to figure out.  I first had to install 2 things: Xcode and the flutter package. Then, i cloned our github repository on my device so that I had the source code. The next thing was figuring out how to install flutter which was a major hassle. I followed some video tutorials as well as the Flutter installation docs which gives you a step by step guide.

### Installing Flutter and Encountering Issues with Pod Installation and Outdated Ruby

Ali: Once i had installed flutter, i had to figure out how to run the app. So through the terminal, I tried going to our refugee pal folder, and running the command “Flutter run”. However, i encountered a bug which was saying that pods needed to be installed. Since our app is using firestore which is like a plugin, we have to install something called cocoapods. However, when i was trying to install cocoapods i realized it wasnt working because the ruby version on my mac laptop was out of date. I had to install homebrew and then install the most up to date version of ruby through the command line, which was 3.2.2 when my laptop had 2.6.

### Successfully Running the App on iOS Simulator and iPhone!

Ali: Finally, i was able to successfully run the app on an iOS simulator using Xcode and also on the web. Now i had to figure out how to run it on my phone. I connected my phone with a cable and tried running. I just had to select which device i wanted to run it on through the command line and change some settings on my phone,and then BAM! It had refugee pal on my iphone. I also changed some things in the pubspec file so that we also had an app icon.

### Preparing for Regionals

Ali: I spent this week mainly doing some final touches to the app, like changing the aesthetics, border radius, and other aspects of the app, making the design consistent. The app definitely needs some improvement in its user interface. I also ran different tests for every single feature makign sure it was fully functional. 

Ali and Antony: We began preparing for the judge presentation. We wrote a detailed script, ran through the presentation a couple times, made a slideshow, and more. Our main goal is to be more organized in our presentation to the judges unlike last time. We also prepared all the peripherals and things we were bringing, like my phone, laptop, posterboard, logbook and binder, etc.
