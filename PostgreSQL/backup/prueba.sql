PGDMP     ,    7                z            Curso    14.2 (Debian 14.2-1.pgdg110+1)    14.2 <    2           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            3           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            4           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            5           1262    16385    Curso    DATABASE     [   CREATE DATABASE "Curso" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';
    DROP DATABASE "Curso";
                postgres    false            �            1255    24577    busquedasalario(integer)    FUNCTION     �   CREATE FUNCTION public.busquedasalario(did integer) RETURNS integer
    LANGUAGE sql
    AS $$
	select salary from employees where id = did
	
$$;
 3   DROP FUNCTION public.busquedasalario(did integer);
       public          postgres    false            �            1255    24623    inserthistoricocars()    FUNCTION       CREATE FUNCTION public.inserthistoricocars() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	insert into historycars(carid,customerid,employeeid,status,totalcost) values (old.id,old.customerid,old.employeeid,old.status,old.totalcost);
return new;
END
$$;
 ,   DROP FUNCTION public.inserthistoricocars();
       public          postgres    false            �            1255    24662    inserthistoricoemployees()    FUNCTION     n  CREATE FUNCTION public.inserthistoricoemployees() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
Usuario Varchar(100) := User;
fecha timestamp := current_timestamp;

Begin
 insert into HistoryEmployees(idemployees,managerid,departmentid,salary,usuario,fecha) values (old.id, old.managerid,old.departmentid,old.salary, usuario, fecha);
 return new;
 END
 $$;
 1   DROP FUNCTION public.inserthistoricoemployees();
       public          postgres    false            �            1259    16418    cars    TABLE     �   CREATE TABLE public.cars (
    id integer NOT NULL,
    customerid integer NOT NULL,
    employeeid integer NOT NULL,
    model character varying(50) NOT NULL,
    status character varying(25) NOT NULL,
    totalcost integer NOT NULL
);
    DROP TABLE public.cars;
       public         heap    postgres    false            �            1259    16417    cars_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.cars_id_seq;
       public          postgres    false    216            6           0    0    cars_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.cars_id_seq OWNED BY public.cars.id;
          public          postgres    false    215            �            1259    16411 	   customers    TABLE       CREATE TABLE public.customers (
    id integer NOT NULL,
    fname character varying(35) NOT NULL,
    lname character varying(35) NOT NULL,
    email character varying(100) NOT NULL,
    phonenumber character varying(11),
    preferredcontact character varying(5) NOT NULL
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    16410    customers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.customers_id_seq;
       public          postgres    false    214            7           0    0    customers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;
          public          postgres    false    213            �            1259    16387    departments    TABLE     f   CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(25) NOT NULL
);
    DROP TABLE public.departments;
       public         heap    postgres    false            �            1259    16386    departments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.departments_id_seq;
       public          postgres    false    210            8           0    0    departments_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;
          public          postgres    false    209            �            1259    16394 	   employees    TABLE     @  CREATE TABLE public.employees (
    id integer NOT NULL,
    fname character varying(35) NOT NULL,
    lname character varying(35) NOT NULL,
    phonenumber character varying(11),
    managerid integer,
    departmentid integer NOT NULL,
    salary integer NOT NULL,
    hiredate timestamp without time zone NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    16393    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    212            9           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    211            �            1259    24600    historycars    TABLE     �   CREATE TABLE public.historycars (
    id integer NOT NULL,
    carid integer NOT NULL,
    customerid integer NOT NULL,
    employeeid integer NOT NULL,
    status character varying(50) DEFAULT 'finished'::character varying,
    totalcost integer
);
    DROP TABLE public.historycars;
       public         heap    postgres    false            �            1259    24599    historycars_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historycars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.historycars_id_seq;
       public          postgres    false    218            :           0    0    historycars_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.historycars_id_seq OWNED BY public.historycars.id;
          public          postgres    false    217            �            1259    24643    historyemployees    TABLE       CREATE TABLE public.historyemployees (
    id integer NOT NULL,
    idemployees integer NOT NULL,
    managerid integer,
    departmentid integer NOT NULL,
    salary integer NOT NULL,
    usuario character varying(100) NOT NULL,
    fecha timestamp without time zone NOT NULL
);
 $   DROP TABLE public.historyemployees;
       public         heap    postgres    false            �            1259    24642    historyemployees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historyemployees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.historyemployees_id_seq;
       public          postgres    false    220            ;           0    0    historyemployees_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.historyemployees_id_seq OWNED BY public.historyemployees.id;
          public          postgres    false    219            ~           2604    16421    cars id    DEFAULT     b   ALTER TABLE ONLY public.cars ALTER COLUMN id SET DEFAULT nextval('public.cars_id_seq'::regclass);
 6   ALTER TABLE public.cars ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            }           2604    16414    customers id    DEFAULT     l   ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);
 ;   ALTER TABLE public.customers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            {           2604    16390    departments id    DEFAULT     p   ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);
 =   ALTER TABLE public.departments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            |           2604    16397    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212                       2604    24603    historycars id    DEFAULT     p   ALTER TABLE ONLY public.historycars ALTER COLUMN id SET DEFAULT nextval('public.historycars_id_seq'::regclass);
 =   ALTER TABLE public.historycars ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    24646    historyemployees id    DEFAULT     z   ALTER TABLE ONLY public.historyemployees ALTER COLUMN id SET DEFAULT nextval('public.historyemployees_id_seq'::regclass);
 B   ALTER TABLE public.historyemployees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            +          0    16418    cars 
   TABLE DATA           T   COPY public.cars (id, customerid, employeeid, model, status, totalcost) FROM stdin;
    public          postgres    false    216   �I       )          0    16411 	   customers 
   TABLE DATA           [   COPY public.customers (id, fname, lname, email, phonenumber, preferredcontact) FROM stdin;
    public          postgres    false    214   �J       %          0    16387    departments 
   TABLE DATA           /   COPY public.departments (id, name) FROM stdin;
    public          postgres    false    210   BP       '          0    16394 	   employees 
   TABLE DATA           m   COPY public.employees (id, fname, lname, phonenumber, managerid, departmentid, salary, hiredate) FROM stdin;
    public          postgres    false    212   sP       -          0    24600    historycars 
   TABLE DATA           [   COPY public.historycars (id, carid, customerid, employeeid, status, totalcost) FROM stdin;
    public          postgres    false    218   �Q       /          0    24643    historyemployees 
   TABLE DATA           l   COPY public.historyemployees (id, idemployees, managerid, departmentid, salary, usuario, fecha) FROM stdin;
    public          postgres    false    220   �Q       <           0    0    cars_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.cars_id_seq', 31, true);
          public          postgres    false    215            =           0    0    customers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.customers_id_seq', 46, true);
          public          postgres    false    213            >           0    0    departments_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.departments_id_seq', 1, false);
          public          postgres    false    209            ?           0    0    employees_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.employees_id_seq', 9, true);
          public          postgres    false    211            @           0    0    historycars_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.historycars_id_seq', 1, true);
          public          postgres    false    217            A           0    0    historyemployees_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.historyemployees_id_seq', 3, true);
          public          postgres    false    219            �           2606    16423    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    216            �           2606    16416    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    214            �           2606    16392    departments departments_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.departments DROP CONSTRAINT departments_pkey;
       public            postgres    false    210            �           2606    16399    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    212            �           2606    24606    historycars historycars_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.historycars
    ADD CONSTRAINT historycars_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.historycars DROP CONSTRAINT historycars_pkey;
       public            postgres    false    218            �           2606    24648 &   historyemployees historyemployees_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.historyemployees
    ADD CONSTRAINT historyemployees_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.historyemployees DROP CONSTRAINT historyemployees_pkey;
       public            postgres    false    220            �           2620    24624    cars historicocarsupdates    TRIGGER     }   CREATE TRIGGER historicocarsupdates BEFORE UPDATE ON public.cars FOR EACH ROW EXECUTE FUNCTION public.inserthistoricocars();
 2   DROP TRIGGER historicocarsupdates ON public.cars;
       public          postgres    false    222    216            �           2620    24663    employees historicotrabajadores    TRIGGER     �   CREATE TRIGGER historicotrabajadores AFTER UPDATE ON public.employees FOR EACH ROW EXECUTE FUNCTION public.inserthistoricoemployees();
 8   DROP TRIGGER historicotrabajadores ON public.employees;
       public          postgres    false    223    212            �           2606    16424    cars cars_customerid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);
 C   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_customerid_fkey;
       public          postgres    false    214    3207    216            �           2606    16429    cars cars_employeeid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(id);
 C   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_employeeid_fkey;
       public          postgres    false    216    212    3205            �           2606    16405 %   employees employees_departmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES public.departments(id);
 O   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_departmentid_fkey;
       public          postgres    false    3203    210    212            �           2606    16400 "   employees employees_managerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.employees(id);
 L   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_managerid_fkey;
       public          postgres    false    212    3205    212            �           2606    24612 "   historycars historycars_carid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.historycars
    ADD CONSTRAINT historycars_carid_fkey FOREIGN KEY (carid) REFERENCES public.cars(id);
 L   ALTER TABLE ONLY public.historycars DROP CONSTRAINT historycars_carid_fkey;
       public          postgres    false    216    3209    218            �           2606    24607 '   historycars historycars_customerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historycars
    ADD CONSTRAINT historycars_customerid_fkey FOREIGN KEY (customerid) REFERENCES public.customers(id);
 Q   ALTER TABLE ONLY public.historycars DROP CONSTRAINT historycars_customerid_fkey;
       public          postgres    false    218    214    3207            �           2606    24617 '   historycars historycars_employeeid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historycars
    ADD CONSTRAINT historycars_employeeid_fkey FOREIGN KEY (employeeid) REFERENCES public.employees(id);
 Q   ALTER TABLE ONLY public.historycars DROP CONSTRAINT historycars_employeeid_fkey;
       public          postgres    false    212    3205    218            �           2606    24654 3   historyemployees historyemployees_departmentid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historyemployees
    ADD CONSTRAINT historyemployees_departmentid_fkey FOREIGN KEY (departmentid) REFERENCES public.departments(id);
 ]   ALTER TABLE ONLY public.historyemployees DROP CONSTRAINT historyemployees_departmentid_fkey;
       public          postgres    false    3203    210    220            �           2606    24649 0   historyemployees historyemployees_managerid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.historyemployees
    ADD CONSTRAINT historyemployees_managerid_fkey FOREIGN KEY (managerid) REFERENCES public.employees(id);
 Z   ALTER TABLE ONLY public.historyemployees DROP CONSTRAINT historyemployees_managerid_fkey;
       public          postgres    false    212    3205    220            +   @  x�uQAN�0<�" em'���J��(����mԒ '>���4MK+!�<;�3�$�@����������l�B�H�,f,ɯl���E��<=w���H��9fY�>�mϖ���0=�է��1��D
��8	�8��l�t�8o��w_d����fm�����8�ǚ5(�R��}^�nS_�X��z�p[U_G���U�ԅ�)�4
E��Y�tPS�=��9k�|��h~¶�����򺱋��+����s BaA�U���TY�"S6���ʻ��8��>����%���H�{o���w��T������      )   5  x��V]s�8|��W�[~�����b+k[ړ�����];K��(�*Z3���cA_�0X=�[�L��ߊ���3�S�����sQ7�5��W޿<��B?ڎn 1��q�w�83+90�j��9s}R�'��:t36R��vZ2�[�o����9��.��b�P��,,��9����PVo���)N��+�2AOţҴ�әm����$+Q�J5����v��ZC�m���ۘƳ�O���<�uU�uYp�)}qv����D1ŭq��ќm������O$%c�z��,�Cgb��UOS$��AO�9ŵόC���
ct1��Е�u�ǳ�����䥒\- N����0�D�w������W�ʚ3�����A�wK����43�f��ɸ�OsI:w]0?����V���$eӠ��]��f�����Q�b�Ck�qQ�B�j��t�;{��m���/���p�d�fB�riR�_�:�!g�-:�Ni,tڤEa�t�����B���H�C1X�6W����3�=g�l*��J���;�ϻ젏��52��Cg��}C��Y��Zd�J���=oͣ��^4Žna�h��3��L!��ѭ��C���X��G����B4\-C��	�Aѻ�����ǬY��R��(h�&`�M�@���;;��Zjv0��Ry=�ݠ�/��!��"}��=f�B��������S&�
ݲ�nt@ h�i[������y9zQDV���n�'r8�>x�1��h�b��2SЋn51H�rk��n'l��ߐM�(bL=�"� ���Y�u�����|@�ղ��٭�-[G���^$�R�<���Z;R�
v��/�`a觬���+,�5r��{o'x販۠ca���D7�FU%�)����zGl߶}�_3�-���^ |�C��G�L��?�b�n-B�J��P�@:"`�<K	��A��Ц�.�ަR��%� $]���Đ����>�����b�~h��� lк�	�nܺ��-�H�C �z5]:<���qm�>&�BN�p��|��\�)za�|��o��`aq*&3n}x�J]��R 
��jڹ��փ�Q��nC�]{d�y�f���S:��<NW��^g_?K��s!����؉7g��
iuK�#�����荬A��������¢&[�!�qvD�8���[�&�&��2���`"Ӈ��{��O�䝎�%3? ���7�C��ڇ�m�
��xt|�Ⱥl��B��^��9��`b��/�Q�2��
���r V��B��[���tz:������z=��e���ˌ��/�o�����|.�      %   !   x�3���2�N�I-�2�IM������� J��      '   ;  x�]��J�@�s�)�fI2��ӛ�+������b������YT:����$��ҭ�z����SF8=!"0b���ю\��o/���˰n����]>W��$�}*b�j�YK~�ܐ4�M����އ��-�B�����,�+�J�2�K�d������ơ��@N!���kYo	����T��>��y����������2�2��(*�$x�[�0��
�>Dq�REQ��b��;�%����)Q>$Bb�ڒA����R�Zx��^�e��p٧O>e���\��t3�GM�)_�ڭװ�o_�A~��T�����(Hp�      -   "   x�3�44�4�4�w���s�440������ >(~      /   P   x�3�4�4b΂�����bN###]c]#cC+S+s=33sS33.#N3�j#Nsc��s��՛i~� T�_     