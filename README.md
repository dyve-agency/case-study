# Study Case

* [Topic](#topic)
* [Frame conditions](#frame-conditions)
* [Tasks](#tasks)
* [Procedure](#procedure)


## Topic

You have to implement a simple  CRUD Food_logger where the user  can log their calories, proteins, carbohydrates, fats.

## Frame conditions

1. You have 4 hours of time.

   If you reach this time limit stop your work and send us your work.  It is one part of the case-study to respect this time limit.

2. There are no restrictions on how to use the provided time.
   If you want to code the entire time, take a break or a coffee - it’s up to you.

3. This is a real world situation. You are allowed to consult the Internet, use every library you want, call a friend.

   **BUT:** You are not allowed to do [pair programming](https://en.wikipedia.org/wiki/Pair_programming).

4. Develop your code based on latest version of Rails (currently 6.1.3.2)

5. Document your code (not the scaffold code).

6. Use open-source third-party packages whenever they make sense. Do not reinvent the wheel.

7. Keep the following priorities in mind while you implementing - in the mentioned order:
   1. Good REST practices.
   2. Code quality
   3. Usage of object oriented methods
   4. Functionality


## Tasks

* [Main tasks](#main-tasks)
* [Optional tasks](#optional-tasks)

### Main tasks

1. A user should be able to sign up/ sign in to the app.

2. The user should see a dashboard just if he is signed in.

3. The dashboard lets the user see their calories, proteins, carbohydrates, fats ranked per each meal type.

4. The user should be able to log their calories, proteins, carbohydrates, fats, per each meal type.

5. You may use a database (relational or not), or store everything in memory.

6. You should  write down a few upsides and downsides of their particular implementation from multiple perspectives (engineering, business, scalability).

### Optional tasks

1. Integrate Social Registration / Social Login (say, Google + Facebook + optionally more) in addition to the existing process. The resulting integration should work smoothly with the existing email/password based one.

2. Write Unit tests for one or more methods.

3. CSS/SCSS styling is not important. Just use Bootstrap or Bulma should be good.


## Procedure

1. Get the code.

      1. Clone this fork to your computer:
         ```bash
         git clone <your github url>
         # Example: git clone git@github.com:zeitdev/case-study.git
         ```

   2. Clone this repository with local branch:
      ```bash
      git clone git@github.com:zeitdev/case-study.git
      git checkout -b run-<yourname>-<branch_name>
      # Example: git checkout -b branch_name
      ```
   3. Just download it from [here]

2. Open in your favorite IDE.

3. Start the study-case.

4. Create a pull request to this repo with your case study. Let your contact know that you completed the PR.
