# -----------------------
# fish configuration file
# -----------------------

# The greeting function will print on new shell
function fish_greeting
    # Empty function so no greeting will be prompted
end

eval (direnv hook fish)

set HOME_BIN $HOME/bin
set -x TERMINAL alacritty
set -x EDITOR vim
set -x BROWSER firefox
set -x VISUAL vim
set -x LC_ALL "en_US.UTF-8"

set -x JAVA_HOME $HOME_BIN/java/jdk8u222-b10
set -x GRADLE_HOME $HOME_BIN/gradle
set -x GRADLE_USER_HOME $HOME/.gradle
set -x ANDROID_HOME $HOME_BIN/android/sdk
set -x MVN_HOME $HOME_BIN/maven
set -x CATALINA_HOME $HOME_BIN/tomcat
set -x KAFKA_HOME $HOME_BIN/kafka
set -x FLUTTER_HOME $HOME_BIN/flutter
set -x XDG_CONFIG_HOME $HOME/.config
set -x GOOGLE_CLOUD_HOME $HOME_BIN/google-cloud-sdk

# PATH {{{
set -x PATH (yarn global bin) $GOOGLE_CLOUD_HOME/bin $HOME/.cargo/bin $MVN_HOME/bin $ANDROID_HOME/platform-tools $ANDROID_HOME/tools $GRADLE_HOME/bin $HOME/.local/bin $FLUTTER_HOME/bin $JAVA_HOME/bin $HOME/bin $HOME/.npm-global/bin $PATH
#}}}

source ~/etc/dotfiles/config/fish/aliases.fish

# Load the non versionned work fish script if it exist.
if test -e ~/etc/dotfiles/config/fish/work.fish
    source ~/etc/dotfiles/config/fish/work.fish
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/yfleury/bin/google-cloud-sdk/path.fish.inc' ]; . '/home/yfleury/bin/google-cloud-sdk/path.fish.inc'; end
if test -f /home/yfleury/.autojump/share/autojump/autojump.fish; . /home/yfleury/.autojump/share/autojump/autojump.fish; end

eval (starship init fish)
