DELETE FROM public.feedback_usuarios_ia
WHERE ctid NOT IN (
    SELECT DISTINCT ON (listener_id) ctid
    FROM public.feedback_usuarios_ia
    ORDER BY listener_id, fecha_registro DESC
);

-- 1. Crear la tabla de Dimensión Usuarios
CREATE TABLE public.dim_usuarios (
    listener_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    username VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    age INT
);

-- 2. Insertar datos ficticios para los listener_id del 1 al 10
INSERT INTO public.dim_usuarios (listener_id, nombre, apellido, username, email, country, age) VALUES
(1, 'Carlos', 'Gómez', 'cgomez_26', 'carlos.gomez@email.com', 'Argentina', 28),
(2, 'María', 'Fernández', 'mfer_stream', 'maria.f@email.com', 'México', 34),
(3, 'Lucas', 'Silva', 'lucassilva_art', 'lucas.silva@email.com', 'Brasil', 22),
(4, 'Sofia', 'Martínez', 'sofia_m99', 'sofia.m@email.com', 'Colombia', 25),
(5, 'Mateo', 'López', 'mlopez_dev', 'mateo.l@email.com', 'Chile', 31),
(6, 'Valentina', 'Rios', 'valen_music', 'valen.rios@email.com', 'Uruguay', 19),
(7, 'Joaquín', 'Pérez', 'joaco_p', 'joaquin.perez@email.com', 'España', 40),
(8, 'Camila', 'Torres', 'cami_torres', 'camila.t@email.com', 'Perú', 27),
(9, 'Diego', 'Sánchez', 'diego_s', 'diego.s@email.com', 'Argentina', 33),
(10, 'Lucía', 'Benítez', 'lu_benitez', 'lucia.b@email.com', 'México', 29);


-- 1. Crear la tabla de Dimensión Plataformas
CREATE TABLE public.dim_plataformas (
    platform_id SERIAL PRIMARY KEY,
    nombre_plataforma VARCHAR(50),
    tipo_dispositivo VARCHAR(50)
);

-- 2. Insertar las plataformas principales
INSERT INTO public.dim_plataformas (nombre_plataforma, tipo_dispositivo) VALUES
('Android App', 'Mobile'),
('iOS App', 'Mobile'),
('Web Player', 'Desktop'),
('Desktop App', 'Desktop'),
('Smart TV App', 'Living Room');


SELECT 
    u.nombre,
    u.apellido,
    u.username,
    u.country,
    f.puntuacion_app,
    f.comentario_libre,
    f.ia_sentimiento,
    f.ia_categoria_ux
FROM public.feedback_usuarios_ia f
JOIN public.dim_usuarios u ON f.listener_id = u.listener_id;


INSERT INTO public.dim_usuarios (listener_id, nombre, apellido, username, email, country, age) 
VALUES (11, 'Agustín', 'Navarro', 'agus_navarro', 'agustin.n@email.com', 'Argentina', 26);

DELETE FROM public.feedback_usuarios_ia
WHERE listener_id NOT IN (SELECT listener_id FROM public.dim_usuarios);

ALTER TABLE public.feedback_usuarios_ia
ADD CONSTRAINT fk_feedback_usuarios
FOREIGN KEY (listener_id) 
REFERENCES public.dim_usuarios (listener_id)
ON DELETE CASCADE;

