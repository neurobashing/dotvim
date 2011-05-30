Installation: 

	git clone git://github.com/neurobashing/dotvim.git ~/.vim

Create symlinks:

	ln -s ~/.vim/vimrc ~/.vimrc
	ln -s ~/.vim/gvimrc ~/.gvimrc

on new machine:
	
	git submodule init
	git submodule update
	sudo gem install github-markup

Adding a submodule \(pathogen\):

	git submodule add GIT\_URL bundle/PLUGIN\_NAME
	git add .
	git commit -m "added some plugin blah blah blah"

Removing a submodule \(pathogen\):

	Remove the entry in .gitmodules
	Remove the entry in .git/config
	git rm --cached bundle/PLUGIN\_NAME
