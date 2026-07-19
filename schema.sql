-- Bảng người dùng
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  hashed_password TEXT NOT NULL,
  role VARCHAR(20) DEFAULT 'user', -- 'user', 'admin'
  balance INTEGER DEFAULT 0, -- số dư tính bằng VNĐ
  membership_days INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Bảng công việc dịch phim
CREATE TABLE translation_jobs (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id INTEGER REFERENCES users(id),
  bilibili_url TEXT NOT NULL,
  video_url TEXT,
  status VARCHAR(20) DEFAULT 'processing',
  created_at TIMESTAMP DEFAULT NOW()
);

-- Bảng diễn đàn
CREATE TABLE forum_posts (
  id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  likes INTEGER DEFAULT 0,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  post_id INTEGER REFERENCES forum_posts(id),
  user_id INTEGER REFERENCES users(id),
  content TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
);

-- Bảng nạp tiền
CREATE TABLE payment_requests (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id INTEGER REFERENCES users(id),
  amount_vnd INTEGER NOT NULL,
  bank_info TEXT,
  transfer_screenshot_url TEXT,
  status VARCHAR(20) DEFAULT 'pending', -- pending, verified, rejected
  created_at TIMESTAMP DEFAULT NOW()
);

-- Bảng giá dịch vụ (quản lý bởi admin)
CREATE TABLE pricing (
  id SERIAL PRIMARY KEY,
  service_name VARCHAR(100) NOT NULL,
  price_per_minute INTEGER DEFAULT 500,
  description TEXT
);

-- Insert giá mặc định
INSERT INTO pricing (service_name, price_per_minute, description) VALUES
('Dịch phim cơ bản', 500, '500đ mỗi phút video'),
('Gói thành viên tháng', 50000, 'Truy cập không giới hạn 30 ngày');
