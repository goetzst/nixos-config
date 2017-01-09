{
        allowUnfree     = true;
        packageOverrides = pkgs_: with pkgs_; {         # pkgs_ is the original set of packages
                browsers = with pkgs; buildEnv {
                        name    = "browsers";           # browser collection
                        paths   = [
                                chromium
                                qutebrowser
                        ];
                };
                office = with pkgs; buildEnv {
                        name    = "office";             # collection of programs 'essential' for working
                        paths   = [
                                aspell
                                aspellDicts.en
                                feh
                                imagemagick
                                jabref
                                keepassx2
                                libreoffice
                                neovim
                                pinta
                                rtorrent
                                texmaker
                                thunderbird
                                zathura
                        ];
                };
                programming = with pkgs; buildEnv {
                        name    = "programming";        # compiler collection
                        paths   = [
                                elixir
                                erlang
                                ghc
                                rustc
                        ];
                };
                rEnv  = pkgs_.rWrapper.override {       # install with nix-env -f "<nixpkgs>" -iA rEnv
                        packages= with pkgs_.pkgs.rPackages;  [
                          likert reshape ggplot2 RColorBrewer directlabels sqldf plyr
                        ];
                };
                # packages currently manually maintained:
                # (2016-12-14)λ nix-env -q
                # arandr-0.1.9
                # browsers
                # cloc-1.70
                # eclipse-modeling-4.6
                # idea-ultimate-2016.3
                # jmtpfs-0.5
                # mpv-0.21.0
                # mumble-1.2.16
                # office
                # openjdk-8u122b00
                # pgadmin3-1.22.1
                # programming
                # qt-5.7.0
                # qt5ct-0.24
                # R-3.2.3-wrapper
                # stack-1.2.0
                # teamspeak-client-3.0.19.4
                # texlive-full
                # webstorm-2016.3.1
                # weechat-1.5
                # youtube-dl-2016.12.12

        };
}
