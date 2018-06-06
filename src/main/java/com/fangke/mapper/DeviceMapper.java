package com.fangke.mapper;

import com.fangke.domain.Base;
import com.fangke.domain.Category;
import com.fangke.domain.Device;
import com.fangke.domain.MallImg;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author by fk
 * @version <0.1>
 * @created on 2018-01-19.
 */
@Mapper
public interface DeviceMapper {

    /**
     * 分页查询设备
     *
     * @param categoryId 类目id
     * @return
     */
    Page<Device> findByDevice(@Param("categoryId") Long categoryId);

    /**
     * 模糊查询
     *
     * @param searchKey 模糊Key
     * @return
     */
    Page<Device> findBySearchKey(@Param("searchKey") String searchKey);

    /**
     * 类目列表
     *
     * @param status 状态
     * @return
     */
    Page<Category> find(@Param("status") String status, @Param("loginCategoryId") Integer loginCategoryId);

    Long appointment(@Param("id") Long id,
                     @Param("userId") Long userId,
                     @Param("message") String message,
                     @Param("deviceName") String deviceName);


    Device findByDetail(@Param("id") Long id);

    List<MallImg> findMallImgByDID(@Param("deviceId") Long deviceId);

    List<Device> getVisitTotal(@Param("loginCategoryId") Integer loginCategoryId);

    Long changeVisiTotal(@Param("id") Long id, @Param("visitTotal") Integer visitTotal);

    List<Device> getDevice(@Param("categoryId") Integer categoryId);

    List<Device> getDeviceByName(@Param("categoryId") Integer categoryId, @Param("deviceName") String deviceName);

    List<Device> getOtherDevice(@Param("categoryId") Long categoryId, @Param("deviceId") Long deviceId);

    List<Base> getOrder(@Param("deviceId") Long deviceId, @Param("categoryId") Integer categoryId);

    List<Base> getAdminOrder(@Param("deviceId") Long deviceId, @Param("categoryId") Integer categoryId);

    Page<Device> search(@Param("deviceName") String deviceName);

    List<Device> getDeviceList(@Param("loginCategoryId") Integer loginCategoryId);
}
