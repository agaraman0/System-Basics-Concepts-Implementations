CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) UNIQUE NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  password_hash VARCHAR(255) NOT NULL
);

CREATE TABLE videos (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT,
  url VARCHAR(255) UNIQUE NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id),
  views INTEGER DEFAULT 0
);

CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  content TEXT NOT NULL,
  user_id INTEGER NOT NULL REFERENCES users(id),
  video_id INTEGER NOT NULL REFERENCES videos(id),
  parent_comment_id INTEGER REFERENCES comments(id),
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE likes (
  user_id INTEGER NOT NULL REFERENCES users(id),
  video_id INTEGER NOT NULL REFERENCES videos(id),
  PRIMARY KEY (user_id, video_id)
);

CREATE TABLE subscriptions (
  subscriber_id INTEGER NOT NULL REFERENCES users(id),
  subscribed_to_id INTEGER NOT NULL REFERENCES users(id),
  PRIMARY KEY (subscriber_id, subscribed_to_id)
);

CREATE TABLE video_tags (
  id SERIAL PRIMARY KEY,
  tag VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE video_taggings (
  video_id INTEGER NOT NULL REFERENCES videos(id),
  video_tag_id INTEGER NOT NULL REFERENCES video_tags(id),
  PRIMARY KEY (video_id, video_tag_id)
);

