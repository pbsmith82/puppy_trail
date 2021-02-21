# puppy_trails
PuppyTrails is an application for Users to walk dogs and list thier own dogs for walking. 



## Installation
Fork and Clone Repository. After checking out the repo run the following commands.

```zsh
bundle install
```

```zsh
rake db:migrate
```

```zsh
rake db:seed
```

You will still need to add a ".env" file to the root directory. In that file you will want to place the following code, and don't use a space.

```zsh
GITHUB_KEY=PUT YOUR GITHUB OAUTH KEY HERE
GITHUB_SECRET=PUT YOUR GITHUB OAUTH KEY HERE
```
Make sure to include the .env in your gitignore.

Now a user can run a local rails server and check it out.  

## Usage
Users will be able to login, and add thier Dog to the list of Dogs that need walked. User can also walk dogs. 

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License
PuppyTrails is available as open source under the terms of the [MIT License](https://github.com/pbsmith82/puppy_trail/blob/master/LICENSE.md).