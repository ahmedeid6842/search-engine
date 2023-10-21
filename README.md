<a name="readme-top"></a>

![search-engine-high-resolution-logo-color-on-transparent-background](https://github.com/ahmedeid6842/search-engine/assets/57197702/5a594296-7162-4b13-b3c1-834768615a8a)

<br>
<br>
<h1 align="center">Search Engine</h1>

### 📑 Table of Contents
- [📘 Introduction](#introduction)
- [🚀 Live Demo](#live-demo)
- [🎥 Presentation Video](#presentation-video)
- [💻 Getting Started](#getting-started)
  - [Prerequisites ❗](#prerequisites)
  - [Setup ⬇️](#setup)
  - [Install :heavy_check_mark: ](#install)
  - [Usage 🤿 🏃‍♂️](#usage)
- [🏗️🔨 Database ERD](#erd)
- [👥 Author](#author)
- [🤝 Contributing](#contribution)
- [⭐️ Show Your Support](#support)
- [🔭 Up Next](#up-next)
- [💎 Lessons Learned](#lessons-learned)
- [🙏 Acknowledgements](#acknowledgements)
- [📜 License ](#license)

## 📘 Introduction <a name="introduction"></a>
<p align="center">
    Welcome to the Search Engine Rails project.:wave: That utilizes the Rails MVC pattern to build a robust search engine and analytics where a user can search for aticles and the search engine will work on finding matched results and also store the user's searches into analytics so the user can know what the most searched queries are and what people search for too.
</p>

<p align="center">
    With the RealTime search box, when a user queries articles <i>"how are you?"</i> the matched articles will be returned, and with the help of background jobs, the analytics for the user will be updated in the background without making the user wait until the analytics are updated, which means the application can receive many search requests and handle them efficiently and quickly.
    By supporting an authentication system, the search analytics can be updated only for the current logged-in user.
</p>


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Live Demo <a name="live-demo"></a>

#### [Search-Engine :globe_with_meridians: :eyes: ](https://search-engine-v2-enhancments-6bd414cc751d.herokuapp.com/users/sign_in)

## 🎥 Presentation Video <a name="presentation-video"></a>

#### [Part-1 👀](https://www.loom.com/share/362bc4e4fe3e4d3c909b9cdfb9bd6f06?sid=f7c0a06c-0c02-4ec9-85eb-e29d7ac02f90)
#### [Part-2 👀](https://www.loom.com/share/89332f06eea1472ab0dbf9a4b00b8ab9?sid=d559b2e1-4a5c-4e12-ab3b-7d8527756aff)

## 💻 Getting Started <a name="getting-started"></a>
To get a local copy up and running, follow these steps.

### Prerequisites ❗<a name="prerequisites"></a>

In order to run this project you need:
<p>
 
<a href="https://skillicons.dev">
        <img src="https://skillicons.dev/icons?i=ruby,rails,postgres,redis&theme=dark"/>
    </a>
 </p>

### Setup ⬇️ <a name="setup"></a>
1. Clone the repository:

    ```shell
      git clone https://github.com/ahmedeid6842/search-engine
    ```  

2. Change to the project directory:

    ```shell
      cd ./search-engine
    ```
### Install :heavy_check_mark: <a name="install"></a>

1. Install the project dependencies using gem:

   ```shell
    bundle install
   ```

2. Create your database and apply your migrates
   ```shell
    rails db:create
   ```

    ```shell
      rails db:migrate
    ```

3. Make sure you redis-server is up and running: 

   _For linux user_

   ```shell
     sudo systemctl status redis-server
   ```
- In case redis server not working to start it:

    _For linux user_
  ```shell
   sudo systemctl start redis-server
  ```
4. start the `sidekiq` by running:

   ```shell
     bundle exec sidekiq
   ```
### Usage 🤿 🏃‍♂️ <a name="usage"></a>

To start the application run the following command:

```shell
rails s
```

The application will be accessible at http://localhost:3000.

- Alright, it's showtime! 🔥 Hit `http://localhost:3000` and BOOM! 💥  You should see the login page and the Search Engine working flawlessly. ✨🧙‍♂️

## 🏗️🔨 [Database ERD](https://drawsql.app/teams/microverse-114/diagrams/search-engine) <a name="erd"></a>

![drawSQL-search-engine-export-2023-10-12](https://github.com/ahmedeid6842/search-engine/assets/57197702/80c893ac-08ff-4d01-b6ea-48d3625a1add)

## 👤 Author <a name="author"></a>
**Ahmed Eid 🙋‍♂️**
- Github: [@ahmedeid6842](https://github.com/ahmedeid6842/)
- LinkedIn : [Ahmed Eid](https://www.linkedin.com/in/ahmed-eid-0018571b1/)
- Twitter: [@ahmedeid2684](https://twitter.com/ahmedeid2684)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contribution"></a>

We're always looking to improve this project! 🔍 If you notice any issues or have ideas for new features, please don't hesitate to submit a [pull request](https://github.com/ahmedeid6842/search-engine/pulls) 🙌 or create a [new issue](https://github.com/ahmedeid6842/search-engine/issues/new) 💡. Your contribution will help make this project even better! ❤️ 💪

## ⭐️ Show your support <a name="support"></a>

If you find this project helpful, I would greatly appreciate it if you could leave a star! 🌟 💟 

## 🔭 Up next <a name="up-next"></a>

- [ ] The current analytics work only if the user types "?". Try to find another efficient search indecator technique rather than the "?" mark.
- [ ] Add recommendation articles feature based on the user's previous searches and analytics. 
- [ ] Add a chart to present the search analytics over time. :chart_with_upwards_trend: :bar_chart: 
- [ ] Apply the admin role.
- [ ] Test the app using Rsepc
## 💎 Lessons Learned <a name="lessons-learned"></a> 

1. How to implement a real-time search engine
2. How to take advantage of background jobs to make the response time faster and handle multiple requests.
3. Implement the analytics functionality and get the trending searches.
4. There is always something new to learn 👨‍💻.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Helpjuice for giving me the opportunity to work on this project. I really learned a lot while implementing this awesome project idea.


## 📜 License <a name="license"></a>

This project is licensed under the MIT License - you can click here to have more details [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
