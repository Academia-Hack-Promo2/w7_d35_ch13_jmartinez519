# Reto Diseñando APIs

# EndPoints

Acceder a todas la noticias de un sitio (Operativo en todos)
get 'feeds/:site'

Acceder a una de la noticias de un sitio (Operativo en todos)
get 'feeds/:site/:id' 

Buscar noticias de un sitio por autor (Operativo en todos)
  get 'feeds/:site/author/:author'

Buscar noticias de un sitio por title (Operativo en Digg)
get 'feeds/:site/title/:title'

Buscar noticias de un sitio por fecha (Operattivo en Mashable, los demas debo convertir el date a string primero)
get 'feeds/:site/date/:date'