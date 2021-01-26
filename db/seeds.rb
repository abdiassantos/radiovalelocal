
p "Users"
(1..5).each do |index|
  User.create(email: FFaker::Internet.email, password: "12345678", name: FFaker::Name.male_name_with_prefix, phone: FFaker::PhoneNumber.phone_number)
end
p "Editorias"
e = Editory.create(name: "Notícias")
e1 = Editory.create(name: "Economia")
e2 = Editory.create(name: "Tecnologia")
e3 = Editory.create(name: "Entretenimento")
e4 = Editory.create(name: "Arte e Fest")
e5 = Editory.create(name: "Esportes")
e6 = Editory.create(name: "Polícia")
e7 = Editory.create(name: "Política")
e8 = Editory.create(name: "Curiosidades")
e9 = Editory.create(name: "Concursos")

p "Artigos"
Editory.all.each do |e|
  (1..20).each do |index|

    a = Article.new(
      editory_id: e.id,
      user_id: User.all.sample.id,
      title: FFaker::Lorem.phrase,
      headline: FFaker::Lorem.phrase[0..29],
      content: FFaker::Lorem.paragraphs,
      subtitle: FFaker::Lorem.phrase,
      published_at: Time.now
    )

    images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
    a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
    a.save
  end
end

p "Municipios"
c = County.create(name: "Teresina")
c1 = County.create(name: "Demerval Lobão")
c2 = County.create(name: "Monsenhor Gil")
c3 = County.create(name: "Floriano")

p "Noticias"
County.all.each do |e|
  (1..20).each do |index|

    a = News.new(
      county_id: e.id,
      user_id: User.all.sample.id,
      title: FFaker::Lorem.phrase,
      headline: FFaker::Lorem.phrase[0..29],
      content: FFaker::Lorem.paragraphs,
      subtitle: FFaker::Lorem.phrase,
      published_at: Time.now
    )

    images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
    a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
    a.save
  end
end

p "Blogs"
(1..15).each do |index|
  b = Blog.create(
    user_id: User.all.sample.id,
    name: FFaker::Lorem.phrase
  )
  images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
  b.photo.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
  b.background.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

  b.save
end

p "Blogs de cidades"
(1..15).each do |index|
  b = Blog.new(
    user_id: User.all.sample.id,
    county_id: County.all.sample.id,
    name: FFaker::Lorem.phrase,
    kind: "county"
  )
  images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
  b.photo.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
  b.background.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

  b.save
end

p "Postagens de blogs"
Blog.where(kind: 0).each do |e|
  (1..20).each do |index|

    a = Note.new(
      blog_id: e.id,
      user_id: User.all.sample.id,
      title: FFaker::Lorem.phrase,
      headline: FFaker::Lorem.phrase[0..29],
      content: FFaker::Lorem.paragraphs,
      subtitle: FFaker::Lorem.phrase,
      published_at: Time.now
    )

    images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
    a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

    a.save
  end
end

p "Postagens de blogs de cidade"
Blog.where(kind: 1).each do |e|
  (1..20).each do |index|

    a = Note.new(
      blog_id: e.id,
      user_id: User.all.sample.id,
      title: FFaker::Lorem.phrase,
      headline: FFaker::Lorem.phrase[0..29],
      content: FFaker::Lorem.paragraphs,
      subtitle: FFaker::Lorem.phrase,
      published_at: Time.now
    )

    images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
    a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

    a.save
  end
end

p "Radio ao vivo"
Radio.create(
  title: "Radio",
  description: "Radio",
  link: "http://s2.webfrequencia.com.br:8080/vale"
)

p "Videos"
(1..20).each do |index|
  Video.create(
    title: FFaker::Lorem.phrase,
    description: FFaker::Lorem.paragraphs,
    link: FFaker::Youtube.url,
  )
end

p "Galerias"
(1..20).each do |index|
  gallery = Gallery.create(
    name: FFaker::Lorem.phrase,
    description: FFaker::Lorem.paragraphs,
  )
  
  images = ["#{Rails.public_path}/seeds/materia1.jpg", "#{Rails.public_path}/seeds/materia2.jpg", "#{Rails.public_path}/seeds/materia3.jpg", "#{Rails.public_path}/seeds/materia4.jpg", "#{Rails.public_path}/seeds/materia5.jpg"]
  (1..5).each do |index|
    image = Image.create(imageable_type: "Gallery", imageable_id: gallery.id)
    image.file.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
  end
end

p "Radio ao vivo"

Medium.create(link: "http://s2.webfrequencia.com.br:8080/vale")

p "YouTube ao vivo"

Medium.create(link: "teste", kind: "youtube")

p "Paginas"

Page.create(title: "Pagina sobre a radio vale", content: "Texto sobre a radio vale")
Page.create(title: "Pagina sobre o grupo vale", content: "Texto sobre o grupo vale", kind: "about_group")
# p "Users"
# (1..5).each do |index|
#   User.create(email: FFaker::Internet.email, password: "12345678", name: FFaker::Name.male_name_with_prefix, phone: FFaker::PhoneNumber.phone_number)
# end
# p "Editorias"
# e = Editory.create(name: "Notícias")
# e1 = Editory.create(name: "Economia")
# e2 = Editory.create(name: "Tecnologia")
# e3 = Editory.create(name: "Entretenimento")
# e4 = Editory.create(name: "Arte e Fest")
# e5 = Editory.create(name: "Esportes")
# e6 = Editory.create(name: "Polícia")
# e7 = Editory.create(name: "Política")
# e8 = Editory.create(name: "Curiosidades")
# e9 = Editory.create(name: "Concursos")

# p "Artigos"
# Editory.all.each do |e|
#   (1..20).each do |index|

#     a = Article.new(
#       editory_id: e.id,
#       user_id: User.all.sample.id,
#       title: FFaker::Lorem.phrase,
#       headline: FFaker::Lorem.phrase[0..29],
#       content: FFaker::Lorem.paragraphs,
#       subtitle: FFaker::Lorem.phrase,
#       published_at: Time.now
#     )

#     images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#     a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
#     a.save
#   end
# end

# p "Municipios"
# c = County.create(name: "Teresina")
# c1 = County.create(name: "Demerval Lobão")
# c2 = County.create(name: "Monsenhor Gil")
# c3 = County.create(name: "Floriano")

# p "Noticias"
# County.all.each do |e|
#   (1..20).each do |index|

#     a = News.new(
#       county_id: e.id,
#       user_id: User.all.sample.id,
#       title: FFaker::Lorem.phrase,
#       headline: FFaker::Lorem.phrase[0..29],
#       content: FFaker::Lorem.paragraphs,
#       subtitle: FFaker::Lorem.phrase,
#       published_at: Time.now
#     )

#     images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#     a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
#     a.save
#   end
# end

# p "Blogs"
# (1..15).each do |index|
#   b = Blog.create(
#     user_id: User.all.sample.id,
#     name: FFaker::Lorem.phrase
#   )
#   images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#   b.photo.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
#   b.background.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

#   b.save
# end

# p "Blogs de cidades"
# (1..15).each do |index|
#   b = Blog.new(
#     user_id: User.all.sample.id,
#     county_id: County.all.sample.id,
#     name: FFaker::Lorem.phrase,
#     kind: "county"
#   )
#   images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#   b.photo.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
#   b.background.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

#   b.save
# end

# p "Postagens de blogs"
# Blog.where(kind: 0).each do |e|
#   (1..20).each do |index|

#     a = Note.new(
#       blog_id: e.id,
#       user_id: User.all.sample.id,
#       title: FFaker::Lorem.phrase,
#       headline: FFaker::Lorem.phrase[0..29],
#       content: FFaker::Lorem.paragraphs,
#       subtitle: FFaker::Lorem.phrase,
#       published_at: Time.now
#     )

#     images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#     a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

#     a.save
#   end
# end

# p "Postagens de blogs de cidade"
# Blog.where(kind: 1).each do |e|
#   (1..20).each do |index|

#     a = Note.new(
#       blog_id: e.id,
#       user_id: User.all.sample.id,
#       title: FFaker::Lorem.phrase,
#       headline: FFaker::Lorem.phrase[0..29],
#       content: FFaker::Lorem.paragraphs,
#       subtitle: FFaker::Lorem.phrase,
#       published_at: Time.now
#     )

#     images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#     a.image.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')

#     a.save
#   end
# end

# p "Radio ao vivo"
# Radio.create(
#   title: "Radio",
#   description: "Radio",
#   link: "http://s2.webfrequencia.com.br:8080/vale"
# )

# p "Videos"
# (1..20).each do |index|
#   Video.create(
#     title: FFaker::Lorem.phrase,
#     description: FFaker::Lorem.paragraphs,
#     link: FFaker::Youtube.url,
#   )
# end

# p "Galerias"
# (1..20).each do |index|
#   gallery = Gallery.create(
#     name: FFaker::Lorem.phrase,
#     description: FFaker::Lorem.paragraphs,
#   )
  
#   images = ["app/assets/images/seeds/materia1.jpg", "app/assets/images/seeds/materia2.jpg", "app/assets/images/seeds/materia3.jpg", "app/assets/images/seeds/materia4.jpg", "app/assets/images/seeds/materia5.jpg"]
#   (1..5).each do |index|
#     image = Image.create(imageable_type: "Gallery", imageable_id: gallery.id)
#     image.file.attach(io: File.open(images.sample), filename: "image.jpg", content_type: 'image/jpg')
#   end
# end

# p "Radio ao vivo"

# Radio.create(title: "Radio ao vivo", description: "Radio ao vivo", link: "http://s2.webfrequencia.com.br:8080/vale")
# Medium.create(link: "http://s2.webfrequencia.com.br:8080/vale")

# p "YouTube ao vivo"

# Medium.create(link: "teste", kind: "youtube")

# p "Paginas"

# Page.create(title: "Pagina sobre a radio vale", content: "Texto sobre a radio vale")
# Page.create(title: "Pagina sobre o grupo vale", content: "Texto sobre o grupo vale", kind: "about_group")

BannerCategory.create(name: "Super")