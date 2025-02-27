# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Cart(models.Model):
    id_cart = models.AutoField(primary_key=True)
    id_customer = models.ForeignKey('Customer', models.DO_NOTHING, db_column='id_customer')
    total_price = models.IntegerField()
    activate = models.IntegerField()
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'cart'


class CartDetail(models.Model):
    id_cart = models.ForeignKey(Cart, models.DO_NOTHING, db_column='id_cart')
    id_product = models.ForeignKey('Products', models.DO_NOTHING, db_column='id_product')
    id_coupon = models.ForeignKey('ProductCoupons', models.DO_NOTHING, db_column='id_coupon')
    number = models.IntegerField()
    price = models.IntegerField()
    status_product = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'cart_detail'


class Categories(models.Model):
    id_category = models.AutoField(primary_key=True)
    category_name = models.CharField(max_length=100)
    icon = models.TextField()
    image_banner = models.TextField()
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()
    create_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'categories'


class Coupons(models.Model):
    id_coupon = models.AutoField(primary_key=True)
    code = models.CharField(max_length=50)
    discount_value = models.IntegerField()
    discount_type = models.CharField(max_length=16)
    time_used = models.IntegerField()
    start_date = models.DateTimeField()
    end_date = models.DateTimeField()
    activate = models.IntegerField()
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()
    create_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'coupons'


class Customer(models.Model):
    id_customer = models.AutoField(primary_key=True)
    id_user = models.ForeignKey('Users', models.DO_NOTHING, db_column='id_user', blank=True, null=True)
    name_customer = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    address = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'customer'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Employees(models.Model):
    id_emp = models.AutoField(primary_key=True)
    id_user = models.ForeignKey('Users', models.DO_NOTHING, db_column='id_user', blank=True, null=True)
    emp_name = models.CharField(max_length=100)
    email = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    address = models.CharField(max_length=100)
    salary = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'employees'


class ImportProducts(models.Model):
    id_imp = models.AutoField(primary_key=True)
    id_product = models.ForeignKey('Products', models.DO_NOTHING, db_column='id_product')
    import_quantity = models.IntegerField()
    import_price = models.IntegerField()
    supplier = models.CharField(max_length=100)
    import_at = models.DateTimeField()
    update_at = models.DateTimeField()
    import_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'import_products'


class LandingPages(models.Model):
    id_landing_pages = models.AutoField(primary_key=True)
    id_emp = models.ForeignKey(Employees, models.DO_NOTHING, db_column='id_emp')
    image = models.TextField()
    activate = models.IntegerField()
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()
    create_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'landing_pages'


class OrderProduct(models.Model):
    id_order = models.AutoField(primary_key=True)
    id_cart = models.ForeignKey(Cart, models.DO_NOTHING, db_column='id_cart')
    id_coupon = models.ForeignKey(Coupons, models.DO_NOTHING, db_column='id_coupon')
    order_description = models.TextField()
    total = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'order_product'


class Payment(models.Model):
    id_payment = models.AutoField(primary_key=True)
    id_order = models.ForeignKey(OrderProduct, models.DO_NOTHING, db_column='id_order')
    payment_status = models.IntegerField()
    order_status = models.CharField(max_length=23)

    class Meta:
        managed = False
        db_table = 'payment'


class ProductCoupons(models.Model):
    id_coupon = models.ForeignKey(Coupons, models.DO_NOTHING, db_column='id_coupon')
    id_product = models.ForeignKey('Products', models.DO_NOTHING, db_column='id_product')

    class Meta:
        managed = False
        db_table = 'product_coupons'


class Products(models.Model):
    id_product = models.AutoField(primary_key=True)
    product_name = models.CharField(max_length=50)
    sku = models.CharField(db_column='SKU', max_length=50)  # Field name made lowercase.
    id_category = models.ForeignKey(Categories, models.DO_NOTHING, db_column='id_category')
    export_price = models.IntegerField()
    product_quantity = models.IntegerField()
    product_description = models.CharField(max_length=1000)
    image_product = models.TextField()
    brand = models.CharField(max_length=200)
    size = models.CharField(max_length=10)
    color = models.CharField(max_length=255)
    activate = models.IntegerField()
    status = models.CharField(max_length=8, blank=True, null=True)
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()
    create_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'products'


class Reviews(models.Model):
    id_review = models.AutoField(primary_key=True)
    id_customer = models.ForeignKey(Customer, models.DO_NOTHING, db_column='id_customer')
    star = models.IntegerField()
    review_description = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'reviews'


class Users(models.Model):
    id_user = models.AutoField(primary_key=True)
    avatar = models.TextField()
    account_type = models.CharField(max_length=100)
    token = models.CharField(max_length=100, blank=True, null=True)
    password = models.CharField(max_length=100, blank=True, null=True)
    create_at = models.DateTimeField()
    update_at = models.DateTimeField()
    create_by = models.CharField(max_length=50)
    update_by = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'users'


class Wishlists(models.Model):
    id_wishlist = models.AutoField(primary_key=True)
    id_customer = models.ForeignKey(Customer, models.DO_NOTHING, db_column='id_customer')
    id_product = models.ForeignKey(Products, models.DO_NOTHING, db_column='id_product')

    class Meta:
        managed = False
        db_table = 'wishlists'
