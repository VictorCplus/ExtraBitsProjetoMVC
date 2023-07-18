PGDMP     %                     {         	   extrabits    14.5    15.3 !               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16821 	   extrabits    DATABASE     �   CREATE DATABASE extrabits WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE extrabits;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �            1259    19042    carrinhocompra    TABLE     �   CREATE TABLE public.carrinhocompra (
    id_compra integer NOT NULL,
    id_usuario integer NOT NULL,
    id_produto integer NOT NULL,
    data_compra date
);
 "   DROP TABLE public.carrinhocompra;
       public         heap    postgres    false    4            �            1259    19041    carrinhocompra_id_compra_seq    SEQUENCE     �   CREATE SEQUENCE public.carrinhocompra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.carrinhocompra_id_compra_seq;
       public          postgres    false    4    214                       0    0    carrinhocompra_id_compra_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.carrinhocompra_id_compra_seq OWNED BY public.carrinhocompra.id_compra;
          public          postgres    false    213            �            1259    19049    historicoproduto    TABLE     #  CREATE TABLE public.historicoproduto (
    id_produto integer NOT NULL,
    nome character varying(100) NOT NULL,
    categoria character varying(100) NOT NULL,
    valor numeric NOT NULL,
    descricao character varying(9999) NOT NULL,
    imagem text NOT NULL,
    data_adicionado date
);
 $   DROP TABLE public.historicoproduto;
       public         heap    postgres    false    4            �            1259    19048    historicoproduto_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.historicoproduto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.historicoproduto_id_produto_seq;
       public          postgres    false    216    4                       0    0    historicoproduto_id_produto_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.historicoproduto_id_produto_seq OWNED BY public.historicoproduto.id_produto;
          public          postgres    false    215            �            1259    16830    produto    TABLE       CREATE TABLE public.produto (
    id_produto integer NOT NULL,
    nome character varying(100) NOT NULL,
    categoria character varying(100) NOT NULL,
    valor numeric NOT NULL,
    descricao character varying(9999) NOT NULL,
    imagem text NOT NULL,
    data_adicionado date
);
    DROP TABLE public.produto;
       public         heap    postgres    false    4            �            1259    16829    produto_id_produto_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.produto_id_produto_seq;
       public          postgres    false    212    4                       0    0    produto_id_produto_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.produto_id_produto_seq OWNED BY public.produto.id_produto;
          public          postgres    false    211            �            1259    16823    usuario    TABLE     _  CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nome character varying(100) NOT NULL,
    email character varying(200) NOT NULL,
    cpf character varying(14) NOT NULL,
    senha character varying(100) NOT NULL,
    telefone character varying(20) NOT NULL,
    data_nascimento date,
    data_cadastro date,
    permissao integer
);
    DROP TABLE public.usuario;
       public         heap    postgres    false    4            �            1259    16822    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.usuario_id_usuario_seq;
       public          postgres    false    4    210                       0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;
          public          postgres    false    209            m           2604    19045    carrinhocompra id_compra    DEFAULT     �   ALTER TABLE ONLY public.carrinhocompra ALTER COLUMN id_compra SET DEFAULT nextval('public.carrinhocompra_id_compra_seq'::regclass);
 G   ALTER TABLE public.carrinhocompra ALTER COLUMN id_compra DROP DEFAULT;
       public          postgres    false    214    213    214            l           2604    16833    produto id_produto    DEFAULT     x   ALTER TABLE ONLY public.produto ALTER COLUMN id_produto SET DEFAULT nextval('public.produto_id_produto_seq'::regclass);
 A   ALTER TABLE public.produto ALTER COLUMN id_produto DROP DEFAULT;
       public          postgres    false    211    212    212            k           2604    16826    usuario id_usuario    DEFAULT     x   ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);
 A   ALTER TABLE public.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       public          postgres    false    210    209    210                      0    19042    carrinhocompra 
   TABLE DATA           X   COPY public.carrinhocompra (id_compra, id_usuario, id_produto, data_compra) FROM stdin;
    public          postgres    false    214   E&                 0    19049    historicoproduto 
   TABLE DATA           r   COPY public.historicoproduto (id_produto, nome, categoria, valor, descricao, imagem, data_adicionado) FROM stdin;
    public          postgres    false    216   �&                 0    16830    produto 
   TABLE DATA           i   COPY public.produto (id_produto, nome, categoria, valor, descricao, imagem, data_adicionado) FROM stdin;
    public          postgres    false    212   �-                 0    16823    usuario 
   TABLE DATA           {   COPY public.usuario (id_usuario, nome, email, cpf, senha, telefone, data_nascimento, data_cadastro, permissao) FROM stdin;
    public          postgres    false    210   �8                  0    0    carrinhocompra_id_compra_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.carrinhocompra_id_compra_seq', 17, true);
          public          postgres    false    213                       0    0    historicoproduto_id_produto_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.historicoproduto_id_produto_seq', 1, false);
          public          postgres    false    215                       0    0    produto_id_produto_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.produto_id_produto_seq', 33, true);
          public          postgres    false    211                       0    0    usuario_id_usuario_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 20, true);
          public          postgres    false    209            s           2606    19047 "   carrinhocompra carrinhocompra_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.carrinhocompra
    ADD CONSTRAINT carrinhocompra_pkey PRIMARY KEY (id_compra);
 L   ALTER TABLE ONLY public.carrinhocompra DROP CONSTRAINT carrinhocompra_pkey;
       public            postgres    false    214            u           2606    19056 &   historicoproduto historicoproduto_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.historicoproduto
    ADD CONSTRAINT historicoproduto_pkey PRIMARY KEY (id_produto);
 P   ALTER TABLE ONLY public.historicoproduto DROP CONSTRAINT historicoproduto_pkey;
       public            postgres    false    216            q           2606    16837    produto produto_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id_produto);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public            postgres    false    212            o           2606    16828    usuario usuario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);
 >   ALTER TABLE ONLY public.usuario DROP CONSTRAINT usuario_pkey;
       public            postgres    false    210               8   x�34�42� #c]s]C.C���9��)'�����LP��Ab�(���qqq ��           x��X]�۸}��
>���>-X�ٝ")�)��nч -�2��
Ezf��{.IIN�O}[����$/���Q�n�t����ٳ;�Ҕ�~ae�ï�=�r����6��<�E�Q.'�v�WUۖ3�x�&e�a����㯪�S�T�x�>[L1�m�#��]�>\���d+;�i;,�Z��"���`��{=t� ��M�Q�`� ��7!�PM��Iaݠk�xͤUְ�ʵ4�GLN&l7":��鳕a���1�]���"9lײ����5��|�h�M��?Ʈ�Zje0U����t�s�J�1��!�l�]j%�pܛmGk��G��LG��T�u�zI�<��pF@T���l �P5�'��`j��gJJq���m����1Ս�\I�&��{����W+f�J�Ƶ���kT�Ԗ�<t������ٍXp��Q�~Ĭ�6L��Q�I�ӌ�d��!���F|f�Т�J���W�8���k%,ܪ�� ��A�U�;� ��z@U8��Zx��� ,zu�>G3�]X�3�A�����w�-��h�gF�ߠQrɐ2�];�"�Z��4�Tٹ��O�ҟzz}����Mj��j���*�j)��&��BD�OJY�����_ ����\ֲ箽�}�F��������0�� �O��7%�=�>j���y�/�L�ϛ2<x��/�|�P
u�I�ȁ����U�C~��Q��G�гV�9��ZE_�x�~i��tql8@3¿̉�[���`���U�*O	FK.�(�d�<Z�3@�&�+�t���
�����u��������pn+�qs5f���$���'6��cht|�j�U�zI���]�'�j)�D��}�SE�S�OUV�>�w�,�j��*�U�%��9u���2WĀ�W�p�c^NeQTYu:���2Q��(�.?����;\�5N�:6�<͋mz�f������Ԓ�U?�ջ�_L��iS�x����f�0Ç>�p5C2A15��
-�<���bN�H.���l�`/[g/��V���Wt�4npK��m��mvHS�2�~VV��c�/�W��|�<W�������!+�C~:��E����{�ˋ�[y�,J����aEzJgw���ô��E|:m�o9Z�dn'/K�Uz�����?� �>k�'��-���hh52
�^�@8��r�l�)hV:�=+X�09�1�R��y%��H��ӈ&��;����\��]3��
�鵒f΍_�n��-�����q���q�V��bra�\��� UW���w_�!�6�Q��Ap�`Kw-�">J�\���7�K� �����d"��j�+��A��O@,f�ZJ�����<�����sWe�LѠ.���;��X��Xe�SZG�'��d^,�΋VKpbx��9�� �v�B���\u���p�ݝ܍�����V��8Q�����dN<������ي�nѶ�������L~e����f$q��dv[,�D)TC�k(��>4�%
v��B��AP���{�]}Å5�H�v\͂��-�7ߗ�b���
��DZ��;Mf��U�_^^�ʦ8��� \�D�.���˗�#�@ܤ�Ҙp�C�hh.)�<����u��"݊������%qx�w�7���e{z����w�>Y+�����}��Ce��*KW_�2�j~
�{ݕi��Y�����߅͐dٱH�]�ú�>�{!O_?�9<���3��R���߳�9����
����9y��)����PЇ�>􏯠�I���v������@������<?�eVT��j�o�S����?Б��         �
  x��[َ��}�����2W�������H���;�Q"KR܆E�;��|J~,�V��A�8�a�[R��.�S�n��Bu�]�}դ�]��Ă$�or�r�2�N2�Z�A���MÅe�N�(�.�,��`J���e_:�V������d�x.�0�y��dي&�
��9re��(0gW�®�� ��]�b��ϴ*�*���A�-V��\va��䡔JI\o$�)�T���Gވ������X�
�k'�%��x�ody�9��t9+�L�U�K��J��$r�V�b1veֈF�*J�K��_v�R�.{�Rк��R(k����`0%�5bZw�I��qX)h1޼�aA*J�U�L�@3@O'3&kE�~NNI�t��0%��!c��s)�����~4L�2�&[.�В{'�H����Y�5�U#ȸ*7�1浢�q�^tɱ�F�X;�ǓC�)��HX�x�� 2����8�U��J�slg�����2�Y �r'��jv�杧!��M��pV�9��5bQ������_�T/���q�!�>ɾ]��q]f�a�W5H�`p���W�RU��l�sd�ӫ�g�������D��=���kÇZE�rr�-R�5� �����O�����:�Q]��T�\��ܣ.X�r�ִ�	a��th8h�O���e���@qL��{�V�0�x�dˁ����+�7�B�xA��@�~9��֙�BXp���*Y.���E�A�p������L�Z��'��XL�������?*u��Ag�K��;qڐ��["���9���&���Ѿsj2��
`\۶V��,P���C��v
7ͫ.�7Uٺ�h�K�J�]�50䡄2آ�h�%	~&�}Mj���R�͒á��H���>�"�er���}m�0���j�q��K}X�~-��2H���/V�럂��Q� I����n���l��Y�f)��l��Q� Z�@iB'�rl�=���JXW�ϔ�	<�iuY��,Im�ѣ��VU#9�C�?~�du��߿����j�M?J-�$�jV�Y�f��jV�3�J��ͪ
�T4��nc���]UU�f�W��@���d2M�]������A��}����=x�~���h���c����M���z��G*da�x	�r,�^n�ۭ���En� �ݱ��q �R�Tg��8���vֳY�f=��lֳY�F=��?K�
`�H��\YIk+�����1��ID�ʋ�ߢ$�����q��������~q�����{��E�o}����M6���F|�e`���E	#fe.C�v����ka�2���֒�`�V�FSY!sX��8���Y��p?YVJ��0��bG�X琠N�(��(�xdH�(T&�@{�ª��8�l�
�4�.7-��[#�����A�뫝#����> 6ҧDx9���(Br5 �!��ت���I���	�h�|7ub��
�o�q�~�C��\�S<"�`Z��AuI��������-y��BW��(�R@�i«Rpc�C1�1��4dO�ڀy�����T�Il�"p: ���ʦ�����1���&����]�w�`�8vM�郶��N���u=�J{�����l14�C�5��	�ʻ�&R2�4`�S�B d���G����	-��9��i���3)xe�_�Ѵ,b5[*K�f�	��}N;��e��<����ZUT;T�H��@-��L����V�1�y)oy^��N����x�؟�Q�؏Ŏ�S���]��`�ċ����E��t{N��ga����ػ�U���7�v��,�b����fj�[���vfڙig��������˞f��y�D�G�Y�{X/��0N����6I����I�ŧ7����O/�._߽`����^��A���ݬf�tfЙA�s-\�3ŝ?�Z��;V�,�{�%��y���ō{qy��j�]9D��oo6��7ܹ^�԰˪������]�zX����"�wއ�,:��̢��,7/��A��d��9����,{���0�*�8�)t�ЙBg
��)4�|�>�����z*�h�����?�����q�jn\��?�Z��q.ys�-��,
�s��/��%���a)F�S���q�Z��&
��������g/>�fo����O��٫��b���s���8LfN�9y�䙓�sN��m�:x��U����x�$�`q������v�h3�[��zX�]����<?��r�˙/�w�T-�Tq��̪�?�_J=T�h��zq�{�K��g�>%͟����?��i2�����̔3S�L��3��?0]�Ƿ7��/�i'���������D�,�����}Y�����Lǳ��� ��bFq���z���̎��PK蛓�.w�ߣ�,plK���%�$�oS�8�-��C���1��ej�d�Zh;�%�����*c�cYkr�����iKjT���`O�|"C�&o���X�O)��ӶG�r��cLN&�ډd;�:04l��eW��R4���{S���rR�n~�1%�Xu�>�SV� COb��|sΦo�m�u�:�Kc��S�ǏL��c��sA����"��t2~d��-��GUH���줎>�Rȱd�ѡ�������f:h��iB�+����R�C�8X2�d���w��\�r
�'L�g
�pja��'�g��BN��(*.�.�Q#f�� J�;��ZK7�~q�={�oI�         h   x�e�=
�0���^ %?��K��tp���m�A0��}	ʲ;����2Q����9G�ʪ�iA�a:�R��s��G�rx!��lMa����s@�"��     