---
title: "Gitpages con Hugo"
author: Adanton
date: 2021-03-01T19:22:32+01:00
draft: false
tags: ["github"]
categories: []
toc: false
backtotop: true
disable_comments: true
---

He creado una página web en Github con Hugo para publicar notas y apuntes sobre las cosas que voy probando.
<!--more-->

## Instalación de Hugo
En linux es fácil instalar Hugo solo tengo que ejecutar:
```
sudo apt install hugo
```
## Crear el sitio
Lo primero es crear una carpeta en local dónde voy a crear toda la estrutura de la página. para ello ejecuto:
``` 
hugo new site <nombre_carpeta>
```

Una vez creada la carpeta tengo que crear un repositorio en ella, así que entro en la carpeta y ejecuto 
```
git init
```
## Instalación del tema
Después descargo el tema que quiero utilizar, hay un buen catálogo de temas en la página de hugo: https://themes.gohugo.io/

En mi caso he usado Harbor y lo instalo desde la misma carpeta de la siguiente forma:
``` 
git submodule add https://github.com/matsuyoshi30/harbor.git themes/harbor
```
Luego tengo que modificar el fichero `config.toml` para configurar el tema, para empezar he copiado el que aparece en la página del tema y a partir de ahí se puede personalizar.

## Modificar plantilla de publicación
Las plantillas de publicación se guardan en la carpeta **archetypes**, puedo crear tantas plantillas como tipos de publicación vaya a realizar, mi plantilla `default.md` tiene la siguiente cabecera:
```
---
title: "{{ replace .Name "-" " " | title }}"
author: Adanton
date: {{ .Date }}
draft: false
tags: []
categories: []
toc: false
backtotop: true
disable_comments: true
---
```
## Crear una publicación
Las publicaciones por defecto las tiene la plantilla en pa carpeta `content/posts` aunque esto se puede configurar en el fichero `config.toml`

Para publicar un post en esta plantilla solo tengo que ejecutar:
```
hugo new posts/Titulo_del_post.md
```
Esto creará un fichero Markdown con la cabecera por defecto dónde puedo añadir el contenido a publicar.

## Ejecutar el servidor en local
Para ver como funciona nuestra página sin tener que subirla a github, puedo ejecutar en la carpeta del proyecto la instrucción:
```
hugo server
```
Con eso ya puedo entrar en la página http://localhost:1313 y puedo ver como funciona.

## Generar la pagina web
Antes de subir la página a Github tengo que generar la web estática, por defecto se genera en la carpeta `public` pero yo necesito que la genere en la carpeta `docs` para indicarle a Github que presente el contenido que está en ese directorio. 

Lo hago con el siguiente comando que también limpia las contenidos que se hayan borrado de la carpeta `content`:
```
hugo --cleanDestinationDir -d docs
```
Después de esto ya puedo hacer un `git push` para subir todo a Github.

Sería interesante ejecutar este comando siempre antes de hacer el `git push`, esto lo puedo hacer con el trigger que está en la carpeta `.git/hooks/pre-commit` pero esto lo comentaré en otro post aparte.
