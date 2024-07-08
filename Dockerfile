FROM neo4j:5.20.0-community as base

# 下载并安装 APOC 插件适用于 5.x 版本的 all JAR 文件
# 你需要根据具体的 APOC 版本替换链接
ADD http://doc.we-yun.com:1008/doc/neo4j-apoc/5.20.0/apoc-5.20.0-extended.jar /plugins

# 添加必要的 Neo4j 配置
RUN echo 'dbms.security.procedures.unrestricted=apoc.*' >> /var/lib/neo4j/conf/neo4j.conf && \
    echo 'apoc.import.file.enabled=true' >> /var/lib/neo4j/conf/neo4j.conf

# 暴露 Neo4j 的默认端口
EXPOSE 7474 7687

# 设置容器入口点（使用 Neo4j 官方提供的入口点）
ENTRYPOINT ["/sbin/tini", "-g", "--", "/startup/docker-entrypoint.sh"]
CMD ["neo4j"]
