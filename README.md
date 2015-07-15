# gentoo-overlay
My personal Gentoo overlay.

You can use it by adding this in */etc/portage/repos.conf/AlexandreFournier.conf*:

```
[AlexandreFournier]
location = /usr/local/portage/AlexandreFournier
sync-type = git
sync-uri = https://github.com/AlexandreFournier/gentoo-overlay.git
masters = gentoo
auto-sync = yes
```

You can also use layman if you prefer:

```
emerge layman
echo source /var/lib/layman/make.conf >> /etc/portage/make.conf
layman -f
layman -a AlexandreFournier
```

