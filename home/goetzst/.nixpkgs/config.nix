{
        allowUnfree     = true;
        packageOverrides = pkgs_: with pkgs_; {         # pkgs_ is the original set of packages
                browsers = with pkgs; buildEnv {
                        name    = "browsers";           # browser collection
                        paths   = [
                                chromium
                                firefox
                                qutebrowser
                        ];
                };
                office = with pkgs; buildEnv {
                        name    = "office";             # collection of programs 'essential' for working
                        paths   = [
                                feh
                                imagemagick
                                jabref
                                keepassx2
                                libreoffice
                                neovim
                                pinta
                                rtorrent
                                scrot
                                texmaker
                                thunderbird
                                zathura
                        ];
                };
                programming = with pkgs; buildEnv {
                        name    = "programming";        # compiler collection
                        paths   = [
                                cabal-install
                                elixir
                                erlang
                                ghc
                                rustc
                        ];
                };
                # packages currently manually maintained:
                # mpv
                # mumble-1.2.16
                # teamspeak-client
                # qt 5
                # qt5ct
                # texlive-full  use stable release
                # youtube-dl
        };
}
