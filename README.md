



## Description
This is a CLI tool that automates the setup of Travela's project



## Installation

The recommended way to install  this package is to do a global install

### Install as global package
```bash
$ sudo npm install -g travela_cli
```


## Usage

The following flags are available  for running different commands
```bash
$ -f or --frontend to setup the frontend
$ -b or --backend to setup the backend
$ -h or --help to access the help menu
```
**Example**
```bash
$ travela <flag> <pathtoenvfile> 
```
**Setup Frontend** 
--
*The example below assumes that the env file is in the same folder where you are running the command, otherwise specify the full path to your env file*
```bash
$ travela -f ./.env 
```
**Setup Backend** 
--
To setup the backend, make sure you have created your database and updated your env file with the database credentials

```bash
$ travela -b ./.env  
```



## Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore -->
<!-- ALL-CONTRIBUTORS-LIST:END -->
Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):


This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!

## License

This project is licensed under
[MIT](https://github.com/codeshifu/sync-dotenv/blob/master/LICENSE)