# Explanation
This is a example Containerfile (similar to a Dockerfile) which can be used to construct an httpd container from UBI Micro and levaraging a simple process manager called [Catatonit](https://github.com/openSUSE/catatonit) which is similar to the commonly used (Tini)[https://github.com/krallin/tini]. The Catatonit process manager is the one that's used inside of podman when the ```podman run --init``` command is used. While this is not technically a supported use case in RHEL (aka we don't test in the way shown in this Containerfile), it does work and is quite simple to use.

