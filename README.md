Installation: 

	git clone git://github.com/neurobashing/dotvim.git ~/.vim

Create symlinks:

	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

on new machine:
	
        ** make sure you don't clone the snipmates repo first. **
	git submodule init
	git submodule update
	sudo gem install github-markup
        cd .vim/bundle/
        git clone git@github.com:neurobashing/snipmate-snippets.git snipmate-snippets

Adding a submodule \(pathogen\):

	git submodule add GIT_URL bundle/PLUGIN_NAME
	git add .
	git commit -m "added some plugin blah blah blah"

Removing a submodule \(pathogen\):

	Remove the entry in .gitmodules
	Remove the entry in .git/config
	git rm --cached bundle/PLUGIN_NAME

Updating pathogen modules:

        git submodule foreach git pull origin master
