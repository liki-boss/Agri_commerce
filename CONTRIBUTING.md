## 1. Clone the repo (done only once)
Open a terminal and run the below commands in your desired directory

*Replace `USERNAME` with your username*
```
git clone https://github.com/liki-boss/Agri_commerce.git
cd Agri_commerce
```

## 2. Workflow (everytime you work on a new feature or fix a bug)

- **Sync it** (can skip this the very first time)
  
    Always keep your local copy of the repository updated with the original repository. 

    **Before making any changes and/or in an appropriate interval**, run the following commands carefully to update your local repository. 

    - Fetch all remote repositories and delete any deleted remote branches
        ```
        git fetch --all --prune
        ```
    - Switch to your branch
        ```
        git checkout <your-branch-name>
        ```
    - Reset your branch to match remote's `connekT` branch
        ```
        git reset --hard origin/connekT
        ```

- **Final steps**
  - Make the desired changes 
    
  - To add the changes to the branch
    ```
    git add .
    ```
    to add specific files
    ```
    git add file1 file2 ...
    ```

  - Commit your changes
    ```
    git commit -m 'relevant message'
    ```
  - Push your awesome work to the remote repository
    ```
    git push
    ```
  - Create a pull request
  
    Finally, go to your repository on github, switch to the branch named after you and click on **compare and pull request**. 

    Then add a title and description to your pull request that explains your precious effort.