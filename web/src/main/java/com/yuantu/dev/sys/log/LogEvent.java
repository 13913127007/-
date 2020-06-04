package com.yuantu.dev.sys.log;

import com.yuantu.dev.sys.entity.Log;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * lmax disruptor Event
 * </p>
 *
 * @author jobob
 * @since 2018-10-07
 */
@Data
@Accessors(chain = true)
public class LogEvent implements Serializable {

    private Log log;

}
