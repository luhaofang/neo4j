# 使用官方 Neo4j 5.21.0 社区版镜像作为基础镜像
FROM neo4j:5.20.0-community as base

# 下载并安装 APOC 插件 适用于 5.x 版本的 all JAR 文件
# 你需要根据具体的 APOC 版本替换链接
ADD http://doc.we-yun.com:1008/doc/neo4j-apoc/5.20.0/apoc-5.20.0-extended.jar /plugins

# 添加必要的 Neo4j 配置
RUN echo 'dbms.security.procedures.unrestricted=apoc.*' >> /var/lib/neo4j/conf/neo4j.conf

# 暴露 Neo4j 的默认端口
EXPOSE 7474 7473 7687

# 继承基础镜像的入口点和命令
ENTRYPOINT ["tini", "-g", "--", "/startup/docker-entrypoint.sh"]
CMD ["neo4j"]
