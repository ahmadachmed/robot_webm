# robot_webm

* To open html report in Jenkins
    ```sh
    You need to follow these steps for solution :
    1. Open the Jenkin home page.
    2. Go to Manage Jenkins.
    3. Now go to Script Console.
    4. In that console paste below line and click on Run.
        System.setProperty("hudson.model.DirectoryBrowserSupport.CSP", "")
    5. open html-report it will show as expected.
    ```
* To run the batch file in jenkins
    ```sh
    1. Open your project config
    2. Go to Build menu, click add build step and choose Execute windows batch
    3. in that command paste below line.
        cd \Regression.bat
    4. Now your build process will require from the bat file
    ```
