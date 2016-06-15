# foaas

#### Table of Contents

1. [Description](#description)
1. [Usage](#usage)

## Description

Access responses from the [FOAAS API](http://foaas.com/).

## Usage

Arguments will be joined into a URL with ```/```.  For example:

### ```GET /version```
~~~
# puppet apply -e 'notice(foaas("version"))'
Notice: Scope(Class[main]): Version 1.0.0
Notice: Compiled catalog for master.whatsaranjit.com in environment production in 0.32 seconds
Notice: Applied catalog in 0.09 seconds
~~~

### ```GET /cool/:from```
~~~
# puppet apply -e 'notice(foaas("cool", "Forge"))'
Notice: Scope(Class[main]): Cool story, bro. - Forge
Notice: Compiled catalog for master.whatsaranjit.com in environment production in 0.33 seconds
Notice: Applied catalog in 0.09 seconds
~~~
