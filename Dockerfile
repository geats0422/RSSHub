FROM diygod/rsshub:chromium-bundled

# 基础配置
ENV NODE_ENV=production
ENV CACHE_TYPE=memory

# 内存优化 - 关键！
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV PUPPETEER_SKIP_DOWNLOAD=true
ENV CHROMIUM_FLAGS="--no-sandbox --disable-dev-shm-usage --single-process --disable-gpu --disable-software-rasterizer --disable-background-networking"

# 限制并发
ENV MAX_CONCURRENT_REQUESTS=1

# 健康检查
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:1200/healthz || exit 1

# 暴露端口
EXPOSE 1200

# 使用官方推荐的启动命令
CMD ["npm", "start"]
