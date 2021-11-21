# WordPress Docker Dev Environment
This repository aims to help WordPress developers quickly bootstrap a WordPress Docker development environment with WP-CLI, PHPMyAdmin and Xdebug.

## Container Features
- Auto install WordPress
- PHPMyAdmin
- Xdebug
- WP-CLI

## Prerequisites

- Install [Docker Desktop](https://docs.docker.com/desktop/)
- [Xdebug](https://xdebug.org/docs/install)

## Installation

- Clone this repo: 
```
git clone https://github.com/eliehanna0/WordPress-Docker-Dev-Environment.git
```
&nbsp;
- Let's build and start our docker container, In the root folder of the project, run:
```
docker-compose up --build
```
&nbsp;


You might have to wait a minute or two the first time you run this for the `wordpress` image to copy the necessary files.
 
 Meanwhile, the `wordpress-installer` image waits until WordPress files are ready before automatically installing it.
 
![image](https://user-images.githubusercontent.com/76950619/142737457-a9a6787f-0934-4a31-a702-0ff7882d603f.png)

 &nbsp;

 
 You will know your installation is complete when you see this message:
 
![image](https://user-images.githubusercontent.com/76950619/142737438-dcb24295-c7c4-4f43-8f0c-7b2853719431.png)

 
 That's it, browse to [http://localhost/](http://localhost/) to check your installed WordPress website, for PHPMyAdmin, go to [http://localhost:8080/](http://localhost:8080/)
 
 ## Using WP-CLI
There are two ways to run [WP-CLI commands](https://developer.wordpress.org/cli/commands/) in this Docker container.

- Using `docker-compose exec`:
```
docker-compose exec wordpress wp post list
```

![image](https://user-images.githubusercontent.com/76950619/142738097-2d23adfb-55dc-47ec-89a3-5ee07be030b5.png)

 
 &nbsp;
 
- Or my preferred way, SHH into the container like so:
```
docker exec -it wordpress /bin/bash
```

Then run whatever WP-CLI command for instance `wp post list`

![image](https://user-images.githubusercontent.com/76950619/142738149-7ef6ba96-62f6-437c-b3ef-c8f9312fa39a.png)

 by the way, use `exit` to return to your terminal from bash
 
 
 ## Debugging with PHPStorm
 Let us setup PHPStorm to listen to incoming Xdebug connections from our docker container.
 
 #### Setup Xdebug in PHPStorm
 Go to `Settings > Languages & Frameworks > PHP > Debug`
 - We are using port `9003` as configured in our `xdebug.ini` [file](https://github.com/eliehanna0/WordPress-Docker-Dev-Environment/blob/main/conf/xdebug.ini) 


 ![image](https://user-images.githubusercontent.com/76950619/142738823-abaa67a9-1d8a-4227-931a-e896cec26fae.png)

 
 #### Mapping The Server
 Navigate to `Settings > Languages & Frameworks > PHP > Servers`
 - Add a new server, I named mine `WP Docker`
 - Host is `localhost` port `80`
 - Debugger is `Xdebug`
 - Make sure `Use path mappings....` is checked ✔️
 - Map the created `wordpress` folder to `/var/www/html` (this folder should have been created by the docker container)
 - Click `OK` to save your settings

This is how your settings should look:

![image](https://user-images.githubusercontent.com/76950619/142738745-57d64a80-3ac1-409b-87ae-e29be2c453d6.png)


#### Debug Configuration
Go to `Run > Edit Configurations...`
- Add a new configuration and select `PHP Remote Debug`
- Give it a name, mine is `WP Docker`
- Select the server we just created `WP Docker`
- Type an IDE key `PHPSTORM` (any value will do since we are not filtering by IDE key in our xdebug.ini)
- Save your settings

![image](https://user-images.githubusercontent.com/76950619/142739245-53a8539b-f696-4c74-9709-9d83679e2349.png)


#### Let us test Xdebug!
I am going to create a breakpoint in an already installed plugin `wordpress/wp-content/plugins/hello.php` on line 54

![image](https://user-images.githubusercontent.com/76950619/142739301-ab63298d-f633-4d7c-a791-5743d0b24073.png)

On the top right toolbar of PHPStorm, select `WP Docker` as our configuration and click on `Start listetning for PHP debug connections`:

![image](https://user-images.githubusercontent.com/76950619/142739343-e9a4e376-9652-4fdb-8cfd-cc252f19c49c.png)

Navigate to `http://localhost/wp-admin/plugins.php` and activate `Hello Dolly` to see our debugger in action:

![image](https://user-images.githubusercontent.com/76950619/142739552-3e8c5e6e-6110-42e0-b2b1-fd484b3f9689.png)



To stop listening to Xdebug connections click on the same button:
![image](https://user-images.githubusercontent.com/76950619/142739368-ff891393-7178-438d-9034-ca0916e75f03.png)

 
 
 ## Roadmap
 - Integrate [Unit tests](https://make.wordpress.org/core/handbook/testing/automated-testing/phpunit/)
 - Add PHPCS
 
 
 ## Contribution
 Yes please!

## Thank You!
Feel free to ask me any questions or offer any suggestions!





