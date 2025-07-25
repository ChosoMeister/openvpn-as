# OpenVPN Access Server - ویرایش نامحدود

### 🔍 معرفی

یک راهکار استقرار کانتینری برای OpenVPN Access Server نسخه 2.14.3 با اصلاح اعتبارسنجی لایسنس به‌منظور حذف محدودیت تعداد اتصال و پشتیبانی از حداکثر ۲۰۴۸ اتصال همزمان.

### ⚠️ اطلاعیه مهم

> **فقط برای اهداف آموزشی و پژوهشی**
> 
> - راهکار فنی برگرفته از [oskr.cn](https://oskr.cn/archives/openvpnaccessserver294po-jie-ren-shu-xian-zhi)
> - استفاده تجاری یا استقرار در محیط تولیدی اکیداً ممنوع است
> - لطفاً به قوانین محلی و توافقنامه لایسنس نرم‌افزارها پایبند باشید
> - تمامی مسئولیت‌ها و ریسک‌ها بر عهده کاربر است

### 🚀 راه‌اندازی سریع

#### پیش‌نیازهای سیستم

| مؤلفه   | نسخه     | توضیحات                    |
|---------|----------|----------------------------|
| Docker  | 20.10+   | بستر اجرای کانتینر         |
| Docker Compose | 1.29+ | ارکستراسیون سرویس‌ها   |
| سیستم‌عامل | Linux | پیشنهاد: Ubuntu 20.04+ یا CentOS 8+ |
| حافظه   | ۵۱۲MB+   | پیشنهاد: ۱GB+              |
| فضا     | ۲GB+     | جهت نگهداری تنظیمات و لاگ‌ها|

#### استقرار فوری

```bash
# ۱. دریافت سورس
git clone https://github.com/your-repo/openvpn-as.git
cd openvpn-as

# ۲. ساخت دایرکتوری داده‌ها
sudo mkdir -p /opt/openvpn-data
sudo chown $USER:$USER /opt/openvpn-data

# ۳. راه‌اندازی سرویس‌ها
docker-compose up -d

# ۴. دریافت رمز اولیه
docker-compose logs openvpn-as | grep "Initial"
```


### 🌐 دسترسی به سرویس‌ها

| سرویس | آدرس | توضیحات |
| :-- | :-- | :-- |
| پنل مدیریت | `https://your-server-ip:943/admin` | پیکربندی و مدیریت کاربران |
| پرتال کاربران | `https://your-server-ip:943` | دریافت تنظیمات کلاینت |
| حساب پیش‌فرض | `openvpn` / `رمز در لاگ‌ها` | حساب ادمین |

```bash
# دریافت رمز اولیه ادمین
docker-compose logs openvpn-as | grep "Initial Admin UI user password"
```


### 📊 ویژگی‌های کلیدی

| ویژگی | وضعیت | توضیحات |
| :-- | :-- | :-- |
| 🚀 **اتصال بی‌نهایت** | ✅ | تا ۲۰۴۸ اتصال همزمان |
| 🛡️ **پروتکل‌های امن** | ✅ | پشتیبانی از UDP و TCP |
| 🖥️ **مدیریت وب** | ✅ | رابط مدیریتی کامل تحت وب |
| 📱 **چندسکویی** | ✅ | پشتیبانی از Windows/macOS/Linux/iOS/Android |
| 📊 **آنالیز ترافیک** | ✅ | نظارت جزئی بر اتصال و ترافیک |
| 🔐 **مدیریت گواهی‌نامه** | ✅ | صدور خودکار گواهی کلاینت |
| 🌍 **توزیع بار** | ✅ | پشتیبانی از چند نمونه و توزیع بار |
| 📈 **دسترس‌پذیری بالا** | ✅ | راه‌اندازی مجدد خودکار و بررسی سلامت |

### 🔧 عملیات و مدیریت

#### کنترل سرویس

```bash
# شروع سرویس‌ها
docker-compose up -d

# توقف سرویس‌ها
docker-compose down

# راه‌اندازی مجدد سرویس خاص
docker-compose restart openvpn-as

# بررسی وضعیت سرویس
docker-compose ps

# مشاهده لحظه‌ای لاگ‌ها
docker-compose logs -f openvpn-as

# ورود به کانتینر جهت خطایابی
docker-compose exec openvpn-as bash
```


#### پشتیبان‌گیری از داده‌ها

```bash
# بکاپ گرفتن از تنظیمات
sudo tar -czf openvpn-backup-$(date +%Y%m%d).tar.gz /opt/openvpn-data

# بازگردانی پشتیبان
sudo tar -xzf openvpn-backup-YYYYMMDD.tar.gz -C /
```


#### عیب‌یابی

<details>
<summary><strong>س: رمز ادمین را فراموش کرده‌ام؟</strong></summary>

```bash
# ریست کردن رمز ادمین
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user openvpn --new_pass newpassword123 SetLocalPassword
```
</details>
<details>
<summary><strong>س: چطور کاربر جدید اضافه کنم؟</strong></summary>

```bash
# افزودن کاربر از طریق خط فرمان
docker-compose exec openvpn-as /usr/local/openvpn_as/scripts/sacli --user username --new_pass password123 SetLocalPassword
```
</details>

### � منابع

| منبع | لینک | توضیحات |
| :-- | :-- | :-- |
| مستندات رسمی | [OpenVPN AS Docs](https://openvpn.net/access-server/) | مستندات کامل محصول |
| Docker Hub | [openvpn/openvpn-as](https://hub.docker.com/r/openvpn/openvpn-as) | ایمیج رسمی داکر |
| دانلود کلاینت | [OpenVPN Connect](https://openvpn.net/client-connect-vpn-for-windows/) | کلاینت برای پلتفرم‌های مختلف |
| انجمن | [OpenVPN Forums](https://forums.openvpn.net/) | انجمن پشتیبانی فنی |

### 📄 مجوز

این پروژه صرفاً جهت آموزش و پژوهش است. لطفاً به این اصول پایبند باشید:

- ✅ استفاده جهت یادگیری شخصی و تحقیقات
- ✅ تبادل فنی و اشتراک‌گذاری
- ❌ استفاده تجاری
- ❌ استقرار در محیط تولیدی
- ❌ نقض مجوز نرم‌افزار

---
اگر ساختار یا لحن رسمی‌تری نیاز دارید، لطفاً اطلاع دهید!

