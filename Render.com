### 3. Database (Supabase hoặc Render PostgreSQL)
- Import `supabase/schema.sql` vào DB

### 4. Tài khoản Admin mặc định
- Username: `huyadmin`
- Password: `admin`

---

## 🔧 Tính năng chính
- ✅ Nhập link Bilibili → Dịch tự động
- ✅ Phụ đề tiếng Việt (hardsub)
- ✅ Lồng tiếng AI (TTS)
- ✅ Diễn đàn thảo luận
- ✅ Nạp tiền & quản lý gói dịch vụ
- ✅ Trang Admin duyệt tiền

---

## 🌐 API Endpoints
- `POST /api/translate` - Dịch phim
- `POST /register` - Đăng ký
- `POST /token` - Đăng nhập
- `GET /admin/payments` - Duyệt nạp tiền

---

## 💡 Gợi ý mở rộng
- Thay Whisper bằng FPT AI hoặc Viettel AI cho chất lượng tốt hơn
- Thêm cache Redis để giảm tải
- Tích hợp Stripe/PayPal
- Tự động detect độ dài video để tính phí chính xác

---

> ⚠️ Lưu ý: Dự án này chỉ dùng cho mục đích học tập. Việc crawl Bilibili có thể vi phạm điều khoản dịch vụ.
