<div class="database">
	<div class="col-sm-9">
		<!-- IF mongo -->
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-hdd-o"></i> Mongo</div>
			<div class="panel-body">
				<div class="database-info">
					<span>MongoDB的版本</span> <span class="text-right">{mongo.version}</span><br/>
					<hr/>
					<span>正常运行时间（秒）</span> <span class="text-right formatted-number">{mongo.uptime}</span><br/>
					<span>存储引擎</span> <span class="text-right">{mongo.storageEngine}</span><br/>
					<span>集合</span> <span class="text-right formatted-number">{mongo.collections}</span><br/>
					<span>对象</span> <span class="text-right formatted-number">{mongo.objects}</span><br/>
					<span>平均。对象大小</span> <span class="text-right">{mongo.avgObjSize} b</span><br/>
					<hr/>
					<span>数据大小</span> <span class="text-right">{mongo.dataSize} mb</span><br/>
					<span>存储大小</span> <span class="text-right">{mongo.storageSize} mb</span><br/>
					<span>索引大小</span> <span class="text-right">{mongo.indexSize} mb</span><br/>
					<!-- IF mongo.fileSize -->
					<span>文件大小</span> <span class="text-right">{mongo.fileSize} mb</span><br/>
					<!-- ENDIF mongo.fileSize -->
					<hr/>
					<span>常驻内存</span> <span class="text-right">{mongo.mem.resident} mb</span><br/>
					<span>虚拟内存</span> <span class="text-right">{mongo.mem.virtual} mb</span><br/>
					<span>映射内存</span> <span class="text-right">{mongo.mem.mapped} mb</span><br/>
				</div>
			</div>
		</div>
		<!-- ENDIF mongo -->

		<!-- IF redis -->
		<div class="panel panel-default">
			<div class="panel-heading"><i class="fa fa-hdd-o"></i> Redis</div>
			<div class="panel-body">
				<div class="database-info">
					<span>Redis 版本</span> <span class="text-right">{redis.redis_version}</span><br/>
					<hr/>
					<span>正常运行时间（秒）</span> <span class="text-right formatted-number">{redis.uptime_in_seconds}</span><br/>
					<span>正常运行时间（天）</span> <span class="text-right">{redis.uptime_in_days}</span><br/>
					<hr/>
					<span>连接的客户端</span> <span class="text-right">{redis.connected_clients}</span><br/>
					<span>连接从站</span> <span class="text-right">{redis.connected_slaves}</span><br/>
					<span>阻止客户端</span> <span class="text-right">{redis.blocked_clients}</span><br/>
					<hr/>

					<span>使用的内存</span> <span class="text-right">{redis.used_memory_human}</span><br/>
					<span>内存碎片率</span> <span class="text-right">{redis.mem_fragmentation_ratio}</span><br/>
					<hr/>
					<span>共收到连接</span> <span class="text-right formatted-number">{redis.total_connections_received}</span><br/>
					<span>总加工命令</span> <span class="text-right formatted-number">{redis.total_commands_processed}</span><br/>
					<span>每秒瞬时OPS。</span> <span class="text-right formatted-number">{redis.instantaneous_ops_per_sec}</span><br/>
					<hr/>
					<span>Keyspace 点击</span> <span class="text-right formatted-number">{redis.keyspace_hits}</span><br/>
					<span>Keyspace Misses</span> <span class="text-right formatted-number">{redis.keyspace_misses}</span><br/>
				</div>
			</div>
		</div>
		<!-- ENDIF redis -->

		<!-- IF mongo -->
		<div class="panel panel-default">
			<div class="panel-heading" data-toggle="collapse" data-target=".mongodb-raw">
				<h3 class="panel-title"><i class="fa fa-caret-down"></i> MongoDB 的原始信息</h3>
			</div>

			<div class="panel-body mongodb-raw collapse">
				<div class="highlight">
					<pre>{mongo.raw}</pre>
				</div>
			</div>
		</div>
		<!-- ENDIF mongo -->

		<!-- IF redis -->
		<div class="panel panel-default">
			<div class="panel-heading" data-toggle="collapse" data-target=".redis-raw">
				<h3 class="panel-title"><i class="fa fa-caret-down"></i> Redis 的原始信息</h3>
			</div>

			<div class="panel-body redis-raw collapse">
				<div class="highlight">
					<pre>{redis.raw}</pre>
				</div>
			</div>
		</div>
		<!-- ENDIF redis -->
	</div>
</div>
