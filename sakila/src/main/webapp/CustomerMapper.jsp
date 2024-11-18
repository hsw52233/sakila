<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.example.sakila.mapper.CustomerMapper">
	<insert id="insertCustomer"
			parameterType="com.example.sakila.vo.Customer">
		INSERT INTO customer (
			store_id, first_name, last_name, email, address_id
		) VALUES (
			#{storeId}, #{firstName}, #{lastName}, #{email}, #{addressId}
		)
	</insert>
</mapper>