# 💻 Resources and Software Utilized
Because this project was completely digital, our materials solely consisted of software


### 🛠️ FlutterFlow No Code and FlutterFlow Documentation
![image](https://user-images.githubusercontent.com/123277428/235285465-d9183e8c-845a-4baf-9659-5dc79e68a06b.png)

FlutterFlow's visual drag-and-drop interface and library of components helped us accelerate the development process of Refugee Pal by automatically generating Flutter/Dart code, which we could easily export. We chose FlutterFlow for its unique features, including source code exporting, Github integration, easy Firebase backend setup, compatibility with multiple operating systems, and extensive library of components. Additionally, the platform's comprehensive documentation, with step-by-step tutorials and video guides, made it easy to build out our app's features.

### 🚀 Firebase and Firebase Documentation
![image](https://user-images.githubusercontent.com/123277428/235285477-0ac5b4d7-aac1-44fc-ac97-0333e7edbc29.png)

Firebase is a backend and database platform by Google that provides a comprehensive set of tools to help build and manage apps. We used it to implement user authentication, cloud messaging, and our firestore realtime database. Firebase alllowed us to manage complex database infastructure without having to worry about backend maintenance and other drawbacks.

### 🎨 Figma
![image](https://user-images.githubusercontent.com/123277428/235285588-d3965ffc-035c-4874-9f19-96e2f295e111.png)

Figma is a design platform which we used for many purposes. We used Figma to brainstorm features, structuring the database, and much more. Additionally, we created wireframe sketches which is an essential mockup of the app design and UI before going into the actual app development.

### 📱Flutter Framework
![image](https://user-images.githubusercontent.com/123277428/235285502-9925d383-0396-4df5-bcc9-4f7cc8c7a6a2.png)

Despite the power and flexibility of the no code builder FlutterFlow, we encountered certain complexities during the development of Refugee Pal that required custom code widgets and functions. To address these challenges, we leveraged the versatile Flutter framework, which enabled us to integrate these custom elements seamlessly into the app's architecture.

### 🛠️ Xcode
![image](https://user-images.githubusercontent.com/123277428/235285568-1abfa306-df18-4fbb-b4fb-41f301d9941b.png)

We utilized the Flutter framework to test Refugee Pal on Xcode, Apple's integrated development environment (IDE) for iOS. This enabled us to ensure that the app functioned seamlessly on iOS devices and delivered the best possible user experience to our target audience. With Flutter, we were able to take advantage of Xcode's advanced debugging and testing tools to ensure that the app was free of any issues that could compromise its functionality.

### 🤖 Android Studio
![image](https://user-images.githubusercontent.com/123277428/235285543-bd4e91da-deba-445c-8c87-8415198b7af4.png)

We also used the Flutter framework to test Refugee Pal on Android Studio, Google's integrated development environment (IDE) for Android. This allowed us to ensure that the app worked flawlessly on a wide range of Android devices, providing an exceptional user experience across different screen sizes, resolutions, and performance levels. Flutter's integration with Android Studio enabled us to leverage its powerful testing and debugging tools to detect and resolve any issues that could affect the app's functionality.

# 👨‍💻 Mobile App Development with FlutterFlow and Firebase

### Firestore

We stored a majority of our data in a NoSQL database, which refers to a non-relational database, organized into different collections with schemas and documents, such as locations for the interactive map, the information for all of our categories in the digital resource hub, healthcare professionals and their information, as well as user information which can be used to personalize the app.

![image](https://user-images.githubusercontent.com/123277428/235285672-aafe6180-60a3-4191-82b0-105f8f40d411.png)

### Firebase User Authentication

We used the user authentication service provided by firebase which allows users to sign in and signup with their email or use social accounts, with email verification and forgot password availability.

![image](https://user-images.githubusercontent.com/123277428/235285684-6f606f97-2f49-4a52-ac4f-ffa4ec78fbf1.png)

### FlutterFlow Drag and Drop UI/UX and component library

To create the visuals and pages of the actual app, we utilized the component library available in FlutterFlow, which are sorted into layout, base, page, and form elements. To the right side of the scren, you can edit the properties of different elements on the page, connect to the database through a backend query and add actions.

![image](https://user-images.githubusercontent.com/123277428/235285691-bc885789-6559-4276-9b55-01f3912b1a97.png)

### Actions and complex functions on FlutterFlow

FlutterFlow lets you add a variety of different complex functions and actions which we used include navigation, backend/database connection, and UI interactions all of which we utilized to implement the functions of our features.

### Backend Query and Query Collections on Firestore

In order to display data from our database, whether it be search or firestore, we use backend queries. Query collections let us display specific data from the database by applying filters and sorting options. These queries can be used to search for documents from collections based on specific conditions. This was utilized across all parts of the app.

![image](https://user-images.githubusercontent.com/123277428/235285708-f00fcd26-7e3f-4277-aaff-bc66aa105032.png)

# Logbook before March TBA

# 🗓️ 2023-03-07: Week 1

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

Ali: The first feature I want to complete is the digital resource hub, so i began planning a roadmap for implementation. At first, i thought of having individual pages for every category and subcategory, but then realized it would be very tedious, ineffective, and slow. The better way was to use the firestore database. At this point, i encountered many roadblocks when trying to structure the database. The digital resource hub was very complex because there is first a category gallery page, then a detailed category page with subcategories, and then another subcategory detailed page. One thing inside of the other.

### Challenges when Working on Firestore database for Categories, Subcategories, and Resourceproviders

Ali: This is when i got the bulk done of the digital resource hub. I realized some mistakes I was making. First was not building the database from bottom to top. I created individual collections for categories, subcategories, and then resource providers which was essentially the content of a subcategory. Each one had certain schemas with data which I also figured out how to display.

### Making Pages for Digital Resource Hub and Backend Querying

Ali: I spent this time creating all the pages of the digital resource hub and making backend query in each one from a specific collection. I had a page wich was a gallery of cards of all the different categories, then a page of an individual category which has a list of its subcategories, and then a subcategory page with information and resource providers, each making a backend query to its respective collection.

# 🗓️ 2023-03-24: Week 3

### Encountering Issues with Digital Resource Hub, Passing Data from Page to Page

Ali: When working on the digital resource hub this day, I encountered two issues which I managed to solve successfully. Firstly was how would i pass data from one page to the other. For example, if you clicked on a category card in the gallery and it lead to you to the same page every time, how would it take the data from the previous page and pass it on? 

After reading the FlutterFlow documents and watching a couple tutorials, i realized how to do this. I had to create a parameter which would pass and define data with an action.

### Figuring out how to Filter Displayed Information from Database in Digital Resource Hub Pages

Ali: The other issue was how I would filter the subcategories and resourceproviders being displayed in the page. All the subcategories of every category are in one document, and when making a backend query i only wanted to display data which was specific to its category. I got some help from Antony to set up a dedicated sub-page which would pass the category and subcategory into the page which displayed subcategories and resource providers. By the end of today, however, I had finally completed the digital resource hub.

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

Ali: Once i had installed Flutter, i had to figure out how to run the app. So through the terminal, I tried going to our refugee pal folder, and running the command “Flutter run”. However, I encountered a bug which was saying that pods needed to be installed. Since our app is using firestore which is like a plugin, we have to install something called CocoaPods. However, when I was trying to install CocoaPods I realized it wasnt working because the Ruby version on my Macbook was out of date. I had to install homebrew and then install the most up to date version of Ruby through the command line, which was 3.2.2 when my laptop had 2.6.

### Successfully Running the App on iOS Simulator and iPhone!

Ali: Finally, I was able to successfully run the app on an iOS simulator using Xcode and also on the web. Now I had to figure out how to run it on my phone. I connected my phone with a cable and tried running. I just had to select which device i wanted to run it on through the command line and change some settings on my phone,and then BAM! It had refugee pal on my iphone. I also changed some things in the pubspec file so that we also had an app icon.

### Preparing for Regionals

Ali: I spent this week mainly doing some final touches to the app, like changing the aesthetics, border radius, and other aspects of the app, making the design consistent. The app definitely needs some improvement in its user interface. I also ran different tests for every single feature makign sure it was fully functional. 

# 🗓️  2023-04-13: Week 6

### Planning for CWSF

Ali and Antony: After qualifying for the Canada-Wide Science Fair, we were very excited and we decided to start planning for the next few weeks immediately. We first laid out a list of tasks separated into improvements to the app, additional research and testing as well as improvements to our presentation. Then, we wrote a timeline for the next four weeks, using the tasks we had laid out.

### Minor App Improvements

Antony: This week, I started working on minor improvements and bug fixes that I did not have time to make before regionals. For CWSF, we wanted Refugee Pal's user accounts to be closely integrated with the interactive map and the find professionals feature, so that refugees are able to click directly on a location or program, view the settlement workers, case managers and organizers involved and chat with them within the app. I made a user profile page which would show up whenever someone's profile picture is clicked on. I also found a solution to a bug we had with stationary widgets by wrapping both elements in a stack instead of in a column, and making one scrollable.

# 🗓️  2023-04-20: Week 7


### Translating Firestore Data

Antony: After last week, we had one more issue with the app. We only got translations to work partially, through Flutterflow's built in Google Translate integration. Unfortunately, it only translated the data hard-coded in the app itself, such as constant page titles that did not change. The firestore data was not translated. To fix this, I researched alternative ways to translate the app. I decided to use the Translate Text in Firestore extension for Firebase. Meanwhile, I made some minor changes to the ProjectBoard.

Antony: I spent the entire weekend working on translations. When I started using the Firestore extension, I found out it was not as easy as I expected it to be. Firstly, the extension outputted data in a map format, which is similar to an array (list) but each value has an index. Flutterflow does not support this format, and I had to write a custom cloud function which would convert the map value to a subcollection. I had no previous experience with Firebase functions or async programming, and it took me two days to write a function which actually worked. Just as I had almost finished, I looked at my Firebase usage and realized that it was over 20 times the free limit. Luckily, I didn't get billed. Out of caution, I downgraded the Firebase plan. Upon inspection, the bug was probably caused by my function triggering itself over and over again recursively.

# 🗓️  2023-04-27: Week 8

### Overhauling Refugee Pal for Helpers

Ali and Antony: This week, we decided to overhaul Refugee Pal for helpers. The version of Refugee Pal for helpers we developed for the regional science fair was very basic; it only allowed helpers to update some data, would not fill in input fields with the existing data. We also wanted to extend the functionality of user accounts and improve our data structure for the interactive map by adding programs, so that refugees can accurately determine thesolutions to their challenges. Antony created a whole new navbar and set of pages. We created organizations, which would allow refugee support organizations to manage and protect their services from editing.

Antony: Around this time, I also managed to get my hands on a Macbook, which helped to speed up development greatly, since the Flutterflow native MacOS app runs much more smoothly than the webapp. I used this extra time to improve the app's design, ensuring that it was as consistent as possible.


# 🗓️  2023-5-4: Week 9

### Plans for Testing

Ali and Antony: By this time, we had begun to realize that many things that we planned for the app were not going to get done. We wanted to reach out to refugee support organizations and test our app, because the last test we had run was with the webapp version of Refugee Pal. Surveying a larger and more diverse sample size, as well as people who actively work to support refugees would allow us to better understand how well our app was working and how we could develop our ideas beyond the Canada-Wide Science Fair, possibly even with external support. We started off by sending emails, but made a few phone calls as well. Unfortuantely, this took longer than expected and by next week we still had not recieved a formal invitation to test the app.

### Improvements to Connect and Explore

Antony: Before the deadline which I had set myself on Sunday, I decided to make some final improvements to Connect and Explore. In Connect and Chats, I enabled uploading images and videos to chat, made minor changes to the user interface and added a new Bottom Sheet element for editing and deleting chat messages. To provide refugees with a personalized experience, we created pins, where the user can pin any location, resource or Q&A chat and come back to it later.

Antony: This came with changes to the Explore page. Instead of having a standard view below the searchbar, now we have the old view with all services on one page, and new views showcasing pinned and recently visited items. I also used redirections back to Explore from the interactive map to enable viewing a list of locations rather than them being on the map only. I did the same, with Q&A chat threads allowing refugees to search for them and sort by category. With this, we had finally finished developing the app.

### Running Refugee Pal on Android Studio

Antony: While I was working on the app, I also set up Android Studio on my PC. It took me an entire morning to set up Android Studio, because I had to enable virtualization and because my antivirus was stopping things from working. After fixing these problems, I was able to run Refugee Pal on the android emulator.

# 🗓️ 2023-6: June

### Fixing issues with Refugee Pal

Antony: After going to the Canada-Wide Science Fair, we decided to take a break for a while and work on other school projects. However, I realized that during judging, we were both very nervous because there were many issues with the app we discovered last-minute. Particularly, the app's translations were very buggy. I did automatically translate all the app's content, but the frontend code for detecting languages and handling different versions of text sometimes made the app crash. I fixed these issues with the app, and it got closer to being fully functional.

# 🗓️ 2023-7: July

### Planning what to do for the summer

Antony: Sadly Ali's going to move to another school next year, so we won't be working on Refugee Pal together anymore. Now, over the summer I mainly want to get two things done - refine the app further and properly test how well Refugee Pal works with refugees in real life. I did some research and I found an interesting science fair in September that I might want to shoot for, the Youth Innovation Showcase. I wrote a brief timeline of what I wanted to achieve, especially during the summer and started a continuation of my logbook from earlier.

### Finding a mentor
Antony: Today, I got a response from Minna Allarakhia, a professor at the University of Waterloo. I asked her if she could be my mentor, and she said yes. I am very excited to meet her virtually. I had a call with her and I showed her through the app, and she gave me some ideas on how I could improve, even some ideas for a whole new way to help refugees by translating signs, but unfortunately I didn't have the time to look into that.

### Working towards trialing Refugee Pal

Antony: Back in May we emailed some refugee support organizations to see if they were willing to test the app and I got a response, from Margarita Tellez Espana, manager of Refugee and Specialized Programs at DIVERSEcity. I followed up with her and asked if we could meet sometime to start working on a plan to test Refugee Pal.

# 🗓️ 2023-8: August

### Starting testing

Antony: Margarita replied to my email and I met with her at DIVERSEcity. We decided to first look over the app together. After that, we could test the app with case workers, who are social workers that work with refugees, refer them to services and help them get settled. Hopefully after that, we could start to test the app with refugees and get a wider range of feedback and testing results. This time, I actually had a lot of time to test the app, so I could take my time with gathering feedback and making improvements. However, I still had more work to do to refine the app, an unexpected amount. I decided to go through every single possible user process to try and catch all the bugs. She also gave me some feedback and suggested that I change the login for Refugee Pal from using email to using phone numbers, which would make it more intuitive.

### Additional fixes to translations

Antony: After looking at the backend again, I noticed that the Firebase Google Translate plugin was set to translate automatically, but the cloud functions that made it readable (the Google Translate plugin outputs data in key-value pairs or the "map" data type, which isn't compatible with FlutterFlow yet) have to be manually triggered. I rewrote the NodeJS code so that the translations automatically get converted into a readable subcollection. I also had to enable features in Google Cloud that required billing, so I created a Google Cloud Function to disable billing if Firestore or Google Translate usage accidentally spiked by experimenting with Pub/Sub triggers and finding a solution in the documentation.

### Planning tweaks to the app structure

Antony: I also had some other changes to the app planned, focused on making existing functions of Refugee Pal more user friendly. Most importantly, I wanted to adapt app widgets so that Refugee Pal would render properly on any screen size. This way, a user could access Refugee Pal on iOS or Android through the native app but also on laptops, desktops and iPads through the web app. This is why I'm really happy we chose to use FlutterFlow in the beginning, because the same code base works on any platform, while typically I'd have to code a Swift app for iOS, a Kotlin app for Android and a React app for web.

Antony: Additionally, I plan on revising some features long term and actually dropping one. The bugs that kept popping up just before the national science fair reminded me that maybe we spent too much time working on new ideas, while neglecting potential problems and synergy between features because we simply didn't have enough time. I decided to drop the Connect with Professionals feature, because all of the doctor data came from a website that could do the exact same thing as Refugee Pal and I realized I could just link to that website in Resources. I also decided to remove direct chats in Refugee Pal, instead connecting user contacts like social workers and case managers through contacts and integrating with WhatsApp for messaging.

Antony: Ultimately I want to focus Refugee Pal around bridging the gap between refugees and information, so I also planned on making finding information more intuitive, simply having topics and subtopics which would lead to locations, Q&A threads and resources on one page making things easier for the user. I also thought about adding generative AI integration, to act as somewhat of a way to search but mostly to act as a way to respond to a human question concisely.

# 🗓️ 2023-9: September

### Preparing for YIS

Antony: Today I started to prepare for the Youth Innovation Showcase, I started by writing my Project Report, which I'd then use as a launching pad for my video and centre the general theme of my presentation around. It was very difficult representing everything I'd worked on in one page, but I tried my best. For the video, I talked about the difficult challenges faced by refugees in their first months in Canada as a hook, then dove deeper into how Refugee Pal works and how it helps, by connecting refugees to services, healthcare and employment which improves their mental health and independence, as well as their sense of belonging.

### More feature planning and development

Antony: This month I knew I would be fairly busy with the start of school, but I still set aside some time to work on revamping Refugee Pal. I focused on doing technical research on how I could implement my changes and drawing how the revamped app would interact with itself. For technical research I found I could achieve WhatsApp integration using deep linking, which technically works like a web link but prompts the phone to start a chat with a specific WhatsApp number instead. For the intelligent summarizer feature, I chose to use LangChain, another low-code builder for AI workflows that could read data off of websites and the OpenAI API. Lastly, I made sketches of the app and some flowcharts on paper to plan out the revamp.

### Implementing earlier feedback

Antony: I implemented some feedback from earlier that Margarita gave me. Firstly, I dropped the email authentication system, which allows refugees to sign in using email and replaced it with phone authentication. I also added a LGBTQ+ category in the app for resources and services for LGBTQ+ refugees and renamed the Food Banks category to broadly encompass food security.

### Testing with case workers

Antony: I continued to work with Margarita to start testing the app with case workers. After meeting again, we decided to have her send the app to case workers, and then they could give the app a look and decide if we could keep moving on with testing. After waiting for two weeks, I received some constructive feedback, but I realized the app wasn't formatting properly. One case worker suggested I change the question and answer threads so that answers given by helpers automatically translate, which I think was an amazing idea. Due to Apple's unsigned app restrictions, I decided to deploy Refugee Pal as a web app that would retain all the functions of the mobile app but run as a progressive web app instead. Next time I need to provide more detailed instructions, and a list of existing issues.

### Finding a new opportunity

Antony: I also did some research on other ways I could work on the market research and outreach aspects of Refugee Pal, possibly by pitching the app with investors, networking or some other way that would give me guidance and help me work towards release. I did some selective searching on Google and I found RADIUS, which is a social innovation lab and startup incubator at Simon Fraser University. One of their programs is Trampoline which helps people who have an idea for an initiative to help migrants and refugees. The program is mostly online and starts next year, so I emailed them - waiting to hear back.

# 🗓️ 2023-10: October

### Adapting app for different screen sizes

Antony: As I prepared for YIS, I made a few final changes to Refugee Pal. I started adapting Refugee Pal for different screen sizes by using adaptive media queries to determine the size of the screen and show or hide certain widgets depending on size. I can use this to have a column of cards, each with information about a resource that turns into a row on desktop. I'm still working on scaling the fonts, because the custom icon font I added to the app crashes when I turn on adaptive text

### Preparing for the interview

Antony: After making some changes, I got an email that I got into the Youth Innovation Showcase semifinals! Unfortunately, the interview was in a few days and I had a lot of work, but I wanted to carefully plan for the interview. I went back to my videos and my project report, even statistics that we used in our presentations back in April and May. I wrote a script for my pitch, making sure to have a few different hooks/pathways depending on if my judges knew a lot about refugees and what they go through.

### Other updates

Antony: Around this time, I also continued staying in touch with my mentor, and I updated her about the Youth Innovation Showcase. I emailed Margarita about meeting again to discuss what I'd been working on with Refugee Pal, but I didn't get a response initially. After my third email, she told me the refugee and specialized programs at DIVERSEcity didn't have a coordinator, so I'd have to wait until the end of November.
