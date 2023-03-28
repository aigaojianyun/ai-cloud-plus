package com.cloud.resource.service.impl;


import com.cloud.common.constant.LangConstants;
import com.cloud.resource.domain.AiContinent;
import com.cloud.resource.domain.AiCountry;
import com.cloud.resource.dto.ContinentDto;
import com.cloud.resource.dto.CountryDto;
import com.cloud.resource.mapper.AiContinentMapper;
import com.cloud.resource.mapper.AiCountryMapper;
import com.cloud.resource.service.IResourceCenterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * 公共资源Service业务层处理
 *
 * @author ai-cloud
 */
@Service
public class ResourceCenterServiceImpl implements IResourceCenterService {

    @Autowired
    private AiContinentMapper continentMapper;

    @Autowired
    private AiCountryMapper countryMapper;

    /**
     * 查询七大洲
     *
     * @param language 语言类型
     * @return 七大洲信息
     */
    @Override
    public List<ContinentDto> selectByContinentList(String language) {
        List<AiContinent> aiContinent = continentMapper.selectByContinentList();
        List<ContinentDto> continentList = new ArrayList<>();
        for (AiContinent continent : aiContinent) {
            ContinentDto continentDto = new ContinentDto();
            continentDto.setId(continent.getId());
            if (language.equals(LangConstants.EN_US)) {
                continentDto.setContinentName(continent.getEnName());
            } else if (language.equals(LangConstants.ZH_CN)) {
                continentDto.setContinentName(continent.getCnName());
            }
            continentList.add(continentDto);
        }
        return continentList;
    }

    /**
     * 查询区域国家信息
     *
     * @param language 语言类型
     * @return 区域国家信息
     */
    @Override
    public List<CountryDto> selectByCountryList(String language) {
        List<AiCountry> aiCountry = countryMapper.selectByCountryList();
        List<CountryDto> countryList = new ArrayList<>();
        for (AiCountry country:aiCountry){
            CountryDto countryDto = new CountryDto();
            countryDto.setId(country.getId());
            countryDto.setCountryIcon(country.getCountryIcon());
            countryDto.setAreaCode(country.getAreaCode());
            countryDto.setLanguage(country.getLanguage());
            countryDto.setLocalCurrency(country.getLocalCurrency());
            if (language.equals(LangConstants.EN_US)) {
                countryDto.setCountryName(country.getEnName());
            } else if (language.equals(LangConstants.ZH_CN)) {
                countryDto.setCountryName(country.getCnName());
            }
            countryList.add(countryDto);
        }
        return countryList;
    }
}
