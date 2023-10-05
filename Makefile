
APP_TITLE = ReverseNX-RT
export APP_TITLE

.PHONY: all clean

all:
	@$(MAKE) -C Overlays/$(APP_TITLE)
	@$(MAKE) -C Overlays/FPSLocker
	@mkdir -p SdOut/atmosphere/contents/
	@mkdir -p SdOut/SaltySD/flags/
	@mkdir -p SdOut/SaltySD/patches/
	@mkdir -p SdOut/switch/.overlays/lang/$(APP_TITLE)
	@mkdir -p SdOut/switch/.overlays/lang/FPSLocker
	@wget $(shell curl -s https://api.github.com/repos/masagrator/SaltyNX/releases/latest|grep 'browser_'|cut -d\" -f4) -O SaltyNX-latest.zip
	@unzip SaltyNX-latest.zip
	@cp -rf SaltySD/* SdOut/SaltySD/
	@cp -rf atmosphere/contents/* SdOut/atmosphere/contents/
	@cp -f Overlays/$(APP_TITLE)/$(APP_TITLE).ovl SdOut/switch/.overlays/$(APP_TITLE).ovl
	@cp -f Overlays/FPSLocker/FPSLocker.ovl SdOut/switch/.overlays/FPSLocker.ovl
	@cp -rf Plugins/FPSLocker-Warehouse/SaltySD/plugins/* SdOut/SaltySD/plugins/
	@cp -f Overlays/$(APP_TITLE)/lang/* SdOut/switch/.overlays/lang/$(APP_TITLE)/
	@cp -f Overlays/FPSLocker/lang/* SdOut/switch/.overlays/lang/FPSLocker/
	@cd $(CURDIR)/SdOut; zip -r -q -9 $(APP_TITLE).zip atmosphere SaltySD switch; cd $(CURDIR)

clean:
	@$(MAKE) -C Overlays/$(APP_TITLE) clean
	@$(MAKE) -C Overlays/FPSLocker clean
	@rm -r -f SdOut SaltyNX-*.zip SaltySD atmosphere