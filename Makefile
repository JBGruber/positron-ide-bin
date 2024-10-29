.PHONY: update install

update:
	bash update_v.sh

install: update
	makepkg -si
