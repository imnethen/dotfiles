#!/bin/sh

# need for borders
# riverctl rule-add -app-id firefox ssd
# riverctl rule-add -app-id org.telegram.desktop ssd
# riverctl rule-add -app-id obsidian ssd
# riverctl rule-add -app-id steam ssd
# riverctl rule-add -app-id zoom ssd

# i dont think this breaks anything
riverctl rule-add -app-id \* ssd

# special tags/windows
riverctl rule-add -app-id firefox tags $((1 << 1))
riverctl rule-add -app-id discord tags $((1 << 2))
riverctl rule-add -app-id vesktop tags $((1 << 2))
riverctl rule-add -app-id org.telegram.desktop tags $((1 << 3))
riverctl rule-add -app-id obsidian tags $((1 << 4))

# examples
# Make all views with an app-id that starts with "float" and title "foo" start floating.
# riverctl rule-add -app-id 'float*' -title 'foo' float

# Make all views with app-id "bar" and any title use client-side decorations
# riverctl rule-add -app-id "bar" csd
