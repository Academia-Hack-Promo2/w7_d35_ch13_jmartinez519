# Reto Diseñando APIs

# EndPoints
  Acceder a todas la noticias de un sitio
  get 'feeds/:site'

  Acceder a unade la noticias de un sitio
  get 'feeds/:site/:id' 

  Buscar noticias de un sitio por autor
  get 'feeds/:site/author/:author'

  Buscar noticias de un sitio por title
  get 'feeds/:site/title/:title'

  Buscar noticias de un sitio por fecha
  get 'feeds/:site/date/:date'