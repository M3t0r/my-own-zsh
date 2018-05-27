function load_plugin() {
	PLUGIN_FILE="$ZCONFDIR/3rd-party/$1/$1.plugin.zsh"
	if [[ -e "$PLUGIN_FILE" ]]; then
		source "$PLUGIN_FILE"
	else
		echo "Could not load zsh plugin '$1'" 2>&1
	fi
}

